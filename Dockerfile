# ── Stage 1: builder ────────────────────────────────────────────────────────
# Install build tools and compile all Python packages into site-packages.
# Nothing from this stage (gcc, build-essential, headers) ends up in the
# final image.
FROM python:3.11-slim AS builder

WORKDIR /build

# Build-time system dependencies only
RUN apt-get update && apt-get install -y \
    build-essential \
    python3-dev \
    portaudio19-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

# Compile and install every package directly into the system site-packages
# so we can copy the whole directory to the runtime stage cleanly.
RUN pip install --no-cache-dir -r requirements.txt

# ── Stage 2: runtime ────────────────────────────────────────────────────────
# Lean image that contains only the compiled packages and application code.
# Build tools are NOT present here.
FROM python:3.11-slim

# Runtime system libraries required by compiled extensions at load time
# (portaudio shared library for PyAudio, libGL/libglib for OpenCV/MediaPipe)
RUN apt-get update && apt-get install -y \
    libportaudio2 \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy compiled Python packages from the builder — no build tools included
COPY --from=builder /usr/local/lib/python3.11/site-packages \
                    /usr/local/lib/python3.11/site-packages

# Copy any builder-installed console scripts / entry-points
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy application source
COPY . .

# Create uploads directory
RUN mkdir -p uploads

# Expose port
EXPOSE 5000

# Set environment variables
ENV PORT=5000
ENV HOST=0.0.0.0
ENV DEBUG=False

# Run the application
CMD ["python", "ai_mock_interview/app.py"]

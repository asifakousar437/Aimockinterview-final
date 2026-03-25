# AI Mock Interview System

An intelligent, interactive mock interview platform that simulates real interview scenarios using artificial intelligence. It helps candidates practice interviews in a realistic environment by asking role-specific questions, analyzing responses, and providing instant feedback.

## 🚀 Features

- **🎙️ Audio Recording & Speech-to-Text**: Record answers and convert them to text automatically
- **🤖 LLM-Powered Analysis**: Advanced AI analyzes answers and provides detailed feedback
- **📊 Adaptive Difficulty**: Questions adjust based on candidate performance
- **👤 Proctoring System**: Face detection and tab monitoring for interview integrity
- **⚡ Real-time Processing**: Visual feedback during answer processing
- **📈 Comprehensive Results**: Detailed feedback with charts and performance metrics
- **🎨 Professional UI**: Modern, responsive design with Tailwind CSS

## 🛠️ Technology Stack

- **Backend**: Flask (Python)
- **Frontend**: HTML5, JavaScript, Tailwind CSS
- **AI/ML**: Groq API, OpenAI API, Computer Vision
- **Audio**: SpeechRecognition, PyAudio
- **Database**: Session-based storage

## 📋 Prerequisites

- Python 3.8+
- Groq API Key
- OpenAI API Key (optional)
- Working microphone and camera
- Modern web browser

## 🚀 Quick Start

### Local Development

1. **Clone the repository**
   ```bash
   git clone https://github.com/asifakousar437/Aimockinterview-final.git
   cd Aimockinterview-final
   ```

2. **Create virtual environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set up environment variables**
   ```bash
   cp .env.example .env
   # Edit .env and add your API keys
   ```

5. **Run the application**
   ```bash
   python ai_mock_interview/app.py
   ```

6. **Open in browser**
   Navigate to `http://localhost:5000`

## 🌐 Deployment

### Railway (Recommended)

1. **Connect your GitHub repository** to Railway
2. **Set environment variables** in Railway dashboard:
   - `GROQ_API_KEY`: Your Groq API key
   - `OPENAI_API_KEY`: Your OpenAI API key (optional)
3. **Deploy** - Railway will automatically detect the configuration from `railway.toml`

### Docker Deployment

1. **Build the image**
   ```bash
   docker build -t ai-mock-interview .
   ```

2. **Run the container**
   ```bash
   docker run -p 5000:5000 --env-file .env ai-mock-interview
   ```

### Heroku Deployment

1. **Create Heroku app**
   ```bash
   heroku create your-app-name
   ```

2. **Set environment variables**
   ```bash
   heroku config:set GROQ_API_KEY=your_key_here
   heroku config:set OPENAI_API_KEY=your_key_here
   ```

3. **Deploy**
   ```bash
   git push heroku main
   ```

## ⚙️ Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|-----------|
| `GROQ_API_KEY` | Groq API key for LLM services | ✅ |
| `OPENAI_API_KEY` | OpenAI API key (alternative LLM) | ❌ |
| `DEBUG` | Enable debug mode | ❌ |
| `PORT` | Application port | ❌ |
| `HOST` | Application host | ❌ |

### API Keys Setup

1. **Get Groq API Key**:
   - Visit [Groq Console](https://console.groq.com/)
   - Sign up and create an API key
   - Add to environment variables

2. **Get OpenAI API Key** (optional):
   - Visit [OpenAI Platform](https://platform.openai.com/)
   - Create an API key
   - Add to environment variables

## 📁 Project Structure

```
ai-mock-interview/
├── ai_mock_interview/
│   ├── app.py                 # Main Flask application
│   ├── config.py             # Configuration settings
│   ├── routes/
│   │   └── interview_routes.py  # Interview API endpoints
│   ├── services/
│   │   ├── evaluation_service.py  # Answer evaluation
│   │   ├── interview_service.py   # Question generation
│   │   ├── llm_service.py         # LLM API calls
│   │   └── ...                    # Other services
│   ├── static/
│   │   ├── js/                  # JavaScript files
│   │   └── images/              # Static images
│   ├── templates/              # HTML templates
│   └── utils/                  # Utility functions
├── requirements.txt            # Python dependencies
├── railway.toml              # Railway deployment config
├── Dockerfile                # Docker configuration
├── Procfile                  # Heroku deployment config
└── .env.example              # Environment variables template
```

## 🎯 How It Works

1. **Setup Phase**: User uploads resume and job description
2. **Interview Phase**: 
   - System generates personalized questions
   - User records audio answers
   - AI analyzes responses in real-time
   - Adaptive difficulty adjusts question complexity
3. **Results Phase**: Comprehensive feedback with performance metrics

## 🔧 Troubleshooting

### Common Issues

1. **"No start command detected" on Railway**
   - ✅ Fixed with `railway.toml` and `Procfile`
   - Railway will automatically detect the start command

2. **Audio not working**
   - Check microphone permissions in browser
   - Ensure PyAudio is installed correctly
   - Try using a different browser

3. **Face detection issues**
   - Ensure good lighting
   - Check camera permissions
   - Verify OpenCV is installed

4. **API rate limits**
   - Application includes graceful fallbacks
   - Consider upgrading API plan for production

### Debug Mode

Enable debug mode for detailed error logging:
```bash
export DEBUG=True
python ai_mock_interview/app.py
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🙏 Acknowledgments

- Groq for providing powerful LLM APIs
- OpenAI for additional AI capabilities
- Flask web framework
- Tailwind CSS for beautiful UI components

## 📞 Support

For support or questions:
- Create an issue on GitHub
- Check the troubleshooting section above
- Review the API documentation

---

**Deployed on Railway**: [Live Demo](https://your-railway-app-url.railway.app)

**Note**: Replace the demo URL with your actual Railway deployment URL.

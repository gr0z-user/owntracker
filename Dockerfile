version: '3'
services:
  recorder:
    image: owntracks/recorder
    environment:
      OTR_HOST: "kebnekaise.lmq.cloudamqp.com"  
      OTR_PORT: "1883"                  
      OTR_USER: "uaclvnaj:uaclvnaj"           
      OTR_PASS: "W_oFh3z2qq8ThpU4wIyxpSuvI7NGo_5K"           
      OTR_HTTPHOST: "0.0.0.0"           # для работы внутри контейнера
      OTR_HTTPPORT: "8083"              # порт для API Recorder
    volumes:
      - owntracks_data:/store           # сохраняет данные в volume

  frontend:
    image: owntracks/frontend
    environment:
      OT_WEB_TITLE: "OwnTracks Map"     # название в веб-интерфейсе
      OT_API_KEY: "ваш_api_key"         # можно сгенерировать любой
      OT_API_URL: "http://recorder:8083" # ссылка на Recorder
    depends_on:
      - recorder
    ports:
      - "80:80"                        # фронтенд будет на порту 80

volumes:
  owntracks_data:                       # volume для хранения данных

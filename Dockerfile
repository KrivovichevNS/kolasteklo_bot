# Установка базового образа
FROM node:latest

# Установка рабочей директории внутри контейнера
WORKDIR /usr/src/app

# Копирование package.json и package-lock.json для установки зависимостей
COPY package*.json ./

# Установка зависимостей приложения
RUN npm ci

# Копирование всех файлов приложения в контейнер
COPY . .

# Определение переменной среды для токена телеграм-бота
# ENV TELEGRAM_TOKEN <your_bot_token>

ENV PORT=3000
EXPOSE $PORT

# Команда, которая будет выполнена при запуске контейнера
CMD ["npm", "start"]
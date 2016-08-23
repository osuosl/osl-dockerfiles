FROM node:argon

RUN mkdir -p /opt/code
WORKDIR /opt/code
RUN git clone --depth 1 --branch v0.1.1 https://github.com/osuosl/timesync-node .

RUN npm install
RUN npm run migrations
RUN npm run create-account -- -u admin -p admin

EXPOSE 8000

CMD [ "npm", "run", "devel" ]

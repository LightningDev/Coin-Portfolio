# Coin Portfolio

![image](https://user-images.githubusercontent.com/8309405/124051644-37093d00-da60-11eb-86a4-0e52b251ab24.png)

This app is for managing your coin portfolio on some popular exchanges like Binance or FTX.

**This app is still in development, feature to caculate missing average price for assets on platforms like Binance will be coming soon!**

### Requirements
```sh
PostgreSQl
Ruby On Rails
```

### Installation

```sh
bundle install
rake db:create
rake db:migration
```

Create `.env` for environment configuration at root of the folder with the following parameters:
```sh
COIN_PORTFOLIO_DEV_DB_USERNAME="yourpostgresql_username"
COIN_PORTFOLIO_DEV_DB_PASSWORD="yourpostgresql_password"

COIN_PORTFOLIO_PRD_DB_USERNAME="yourpostgresql_username"
COIN_PORTFOLIO_PRD_DB_PASSWORD="yourpostgresql_password"

BINANCE_END_POINT="https://api.binance.com"
FTX_END_POINT="https://ftx.com/api"
```

Then run the app on http://locahost:3000

```sh
rails s
```

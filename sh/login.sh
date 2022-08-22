curl -X 'POST' \
  'https://smartsafeschool.com/api/chess-mobile/login' \
  -H 'accept: application/json' \
  -H 'Content-Type: */*' \
  -d '{
  "version": "string",
  "entityAction": {
    "actionCode": "CREATE_ENTITY"
  },
  "entityInfo": {
    "accessToken": null,
    "userLogin": "tttttt",
    "userPass": "111",
    "appPackage": "not defined",
    "appVersion": "0.0.0"
  }
}' -vvv
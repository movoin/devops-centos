# Create app group
groupadd -g $APP_GID $APP_GROUP

# Create app user
useradd -g $APP_GID -u $APP_UID $APP_USER -d $APP_PATH

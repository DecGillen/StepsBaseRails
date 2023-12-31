CURRENT_INSTANCE=$(sudo docker ps -a -q --filter ancestor="$IMAGE_NAME" --format="{{.ID}}")

if [ -n "$CURRENT_INSTANCE" ]; then 
  sudo docker stop "$CURRENT_INSTANCE"
  sudo docker rm "$CURRENT_INSTANCE"
fi

sudo docker pull "$IMAGE_NAME"

CONTAINER_EXISTS=$(sudo docker ps -a | grep "$CONTAINER_NAME")
if [ -n "$CONTAINER_EXISTS" ]; then 
  sudo docker rm "$CONTAINER_NAME"
fi

sudo docker create -p 443:443 -p 3000:3000 --name "$CONTAINER_NAME" "$IMAGE_NAME"
sudo docker cp ./privatekey.pem "$CONTAINER_NAME":/usr/src/app/
sudo docker cp ./server.crt "$CONTAINER_NAME":/usr/src/app/
            
sudo docker start "$CONTAINER_NAME"
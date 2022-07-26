# Music API

```
brew install ffmpeg
pip install spotdl
```

## minio setup
minio build
```
docker run \
  -p 9000:9000 \
  -p 9001:9001 \
  --user $(id -u):$(id -g) \
  --name minio \
  -v ${HOME}/minio-data:/data \
  -e "MINIO_ROOT_USER=minio" \
  -e "MINIO_ROOT_PASSWORD=minio123" \
  quay.io/minio/minio server /data --console-address ":9001"
```

minio start
```
docker start minio
```

## get artist music data from spotify

```
rake import_data:from_spotify
```

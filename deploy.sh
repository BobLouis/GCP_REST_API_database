GOOGLE_PROJECT_ID=mysql-test-331907
CLOUD_RUN_SERVICE=bark-bark-api-service
INSTANCE_CONNECTION_NAME=mysql-test-331907:asia-east1:mysql-test
DB_USER=root
DB_PASS=900316
DB_NAME=dog_data

gcloud builds submit --tag gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
    --project=$GOOGLE_PROJECT_ID

gcloud run deploy $CLOUD_RUN_SERVICE \
    --image gcr.io/$GOOGLE_PROJECT_ID/$CLOUD_RUN_SERVICE \
    --add-cloudsql-instances $INSTANCE_CONNECTION_NAME \
    --update-env-vars INSTANCE_CONNECTION_NAME=$INSTANCE_CONNECTION_NAME,DB_PASS=$DB_PASS,DB_USER=$DB_USER,DB_NAME=$DB_NAME \
    --platform managed \
    --region asia-east1 \
    --allow-unauthenticated \
    --project=$GOOGLE_PROJECT_ID
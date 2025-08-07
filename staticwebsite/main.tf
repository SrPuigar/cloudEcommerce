
# Creamos el bucket s3 y lo habilitamos para hosting de una web estática 
resource "aws_s3_bucket" "sergiocloud" {
    bucket = var.bucketname
    
    policy = file("${path.module}/s3_policy.json")


    website {
        index_document = "index.html"
        error_document = "error.html"
    }

    tags = {
        terraform = "true"
        website_hosting = "true"
    }

}

# Subimos los archivos al bucket s3
resource "aws_s3_bucket_object" "index_object" {
    bucket = var.bucketname
    source    = "${path.module}/html/index.html"
    depends_on = [aws_s3_bucket.sergiocloud]
    key      = "index.html"
    content_type = "text/html"


}

resource "aws_s3_bucket_object" "error_object" {
    bucket = var.bucketname
    source    = "${path.module}/html/error.html"
    key      = "error.html"
    depends_on = [aws_s3_bucket.sergiocloud]
    content_type = "text/html"



}

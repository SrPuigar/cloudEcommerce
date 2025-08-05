# Creamos el bucket s3 y lo habilitamos para hosting de una web estática 
resource "aws_s3_bucket" "sergiocloud" {
    bucket = "sergio-cloud-website-bucket"
    acl    = "public-read"
    policy = file("s3_policy.json")

    website {
        index_document = "index.html"
        error_document = "error.html"
    }

    tags = {
        Application = "static_website"
        Owner       = "SergioCloud"
    }
}

# Subimos los archivos al bucket s3
resource "aws_s3_bucket_object" "index_object" {
    bucket = aws_s3_bucket.sergiocloud.bucket
    key    = "index.html"
    source = "./html/index.html"

}

resource "aws_s3_bucket_object" "error_obºject" {
    bucket = aws_s3_bucket.sergiocloud.bucket
    key    = "error.html"
    source = "./html/error.html"

}


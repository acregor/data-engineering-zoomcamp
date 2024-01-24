variable "credentials" {
  description = "My Credentials"
  default     = "/home/Aisling.Cregan/.gc/aisling-de-zoomcamp-2024-10672d5ecbb3.json"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}


variable "project" {
  description = "Project"
  default     = "aisling-de-zoomcamp-2024"
}

variable "region" {
  description = "Region"
  #Update the below to your desired region
  default     = "europe-west1"
}

variable "location" {
  description = "Project Location"
  #Update the below to your desired location
  default     = "EUROPE-WEST1"
}

variable "bq_dataset_name" {
  description = "de-zoomcamp-dataset"
  #Update the below to what you want your dataset to be called
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "de-zoomcamp-bucket"
  #Update the below to a unique bucket name
  default     = "terraform-demo-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
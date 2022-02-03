output "s3_arn" {
<<<<<<< HEAD
    value = aws_s3_bucket.devops-s3-1-2-3.arn
=======
    value = aws_s3_bucket.devops-s3-1[0].arn
>>>>>>> 38195a33b3abfc89854bdadcd53e01381da7033e
}
from django.db import models

# Create your models here.
class regi(models.Model):
    fname=models.CharField(max_length=20)
    lname=models.CharField(max_length=20)
    email=models.EmailField()
    password=models.CharField(max_length=6)
    address=models.CharField(max_length=50)
    city=models.CharField(max_length=20)
    state=models.CharField(max_length=20)
    zipcode=models.IntegerField()
    
    def __str__(self):
       return self.fname


class upload(models.Model):
    title=models.CharField(max_length=50)
    comments=models.CharField(max_length=50)
    fileupload=models.FileField(upload_to='upload')

    def __str__(self):
        return self.title

class feedback(models.Model):
    email=models.CharField(max_length=50)
    feedback=models.CharField(max_length=500)
    
    def __str__(self):
        return self.email



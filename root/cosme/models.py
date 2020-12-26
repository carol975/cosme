from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class UserProfile(models.Model):
    user = models.OneToOneField(User)
    profile_pic_url = models.CharField(max_length=2083)
    created_at_datetime = models.DateTimeField(auto_now=True)
    updated_at_datetime = models.DateTimeField(auto_now=True)

class Product(models.Model):
    id = models.AutoField(primary_key=True)
    brand = models.CharField(max_len=120, null=False)
    description = models.CharField(max_len=2083)
    barcode_str = models.CharField(max_len=120)
    overall_rating = models.DecimalField(max_digit=2, decimal_places=1, min_value=0, max_value=5)
    overall_safety_score = models.DecimalField(max_digit=2, decimal_places=1, min_value=0, max_value=5)
    photo_url = models.CharField(max_len=120)
    created_at_datetime = models.DateTimeField(auto_now=True, null=False)
    updated_at_datetime = models.DateTimeField(auto_now=True, null=False)
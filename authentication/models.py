
from django.db import models
class User(models.Model):
    email = models.EmailField(unique=True)
    is_active = models.BooleanField(default=False)
    otp = models.CharField(max_length=6, blank=True, null=True)
    otp_created_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return self.email

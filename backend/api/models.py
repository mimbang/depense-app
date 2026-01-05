from django.db import models
import uuid

# Create your models here.
TYPE_CHOICES = [
    ('INCOME', 'Entrée'),
    ('EXPENSE', 'Dépense'),
]

class Transaction(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    description = models.CharField(max_length=255, blank=True, null=True)
    category = models.CharField(max_length=100, blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    type = models.CharField(max_length=7, choices=TYPE_CHOICES)
    
    class Meta:
      ordering = ['-created_at']  

    def __str__(self):
        return f"{self.description}: {self.amount} on {self.created_at}"
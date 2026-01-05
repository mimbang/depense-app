from django.contrib import admin

# Register your models here.

from django.contrib import admin
from .models import Transaction

@admin.register(Transaction)
class TransactionAdmin(admin.ModelAdmin):
    list_display = ('description', 'amount', 'type', 'category', 'created_at')
    list_filter = ('type', 'category')
    search_fields = ('description', 'category')
    ordering = ('-created_at',)
from django.shortcuts import render
from rest_framework import generics

from .serializers import TransactionSerializer
from .models import Transaction
# Create your views here.

class TansactionListCreateView(generics.ListCreateAPIView):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer
    

# recupere mets a jour et supprime en seul endpoint
class TransactionDetailView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer
    lookup_field = 'id'
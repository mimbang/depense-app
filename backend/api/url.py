from django.contrib import admin
from django.urls import path 
from .views import TansactionListCreateView , TransactionDetailView

urlpatterns = [
    path('transactions/',TansactionListCreateView.as_view()),
    path('transactions/<uuid:id>/',TransactionDetailView.as_view()),
]

from rest_framework import viewsets

from .serializers import TaskSerializer
from .models import Task


class TaskViewSet(viewsets.ModelViewSet):
    queryset = Task.objects.all().order_by('createdAt')
    serializer_class = TaskSerializer
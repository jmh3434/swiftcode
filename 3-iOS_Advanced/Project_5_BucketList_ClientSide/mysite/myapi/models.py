from django.db import models


class Task(models.Model):
    objective = models.CharField(max_length=200)
    createdAt = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.objective
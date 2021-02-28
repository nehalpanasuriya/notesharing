from django import forms
from .models import regi,upload,feedback

class regiform(forms.ModelForm):
    class Meta:
        model=regi
        fields='__all__'

class uploadform(forms.ModelForm):
    class Meta:
        model=upload
        fields='__all__'

class feedform(forms.ModelForm):
    class Meta:
        model=feedback
        fields='__all__'

from django.shortcuts import render,HttpResponse,redirect
from django.contrib.auth import authenticate
from .models import regi,upload,feedback
from .forms import regiform,uploadform,feedform
from django.conf import settings 
from django.core.mail import send_mail 


def index(request):
    user=request.session.get('email')
    #return HttpResponse("wellcome to wikipedia")
    if request.method=='POST':
        rfrm=regiform(request.POST)
        if rfrm.is_valid():
            rfrm.save()
            # subject = 'welcome to my django project testing'
            # message = f'Hi , thank you for registering in notesharing site.'
            # email_from = settings.EMAIL_HOST_USER 
            # recipient_list = [rfrm.cleaned_data.get('email')] 
            # send_mail( subject, message, email_from, recipient_list ) 
            
            print('Record Inserted!')
            return redirect('index')
        else:
            print('Record not inserted!')
            print(rfrm.errors)
    else:
        rfrm=regiform()
        return render(request,'index.html',{'rfrm':rfrm,'user':user})
        

def feedbackpage(request):
    #return HttpResponse("give a rate and review.")
    user=request.session.get('email')

    if request.method=='POST':
        femail=feedform(request.POST)
        if femail.is_valid():
            femail.save()
            print('record are inserted')
            return redirect('home')
        else:
            print("record are not inserted")
            print(femail.errors)
    else:
        femail=feedform()
        return render(request,'feedbackpage.html',{'user':user})

def updateprofile(request):
    user=request.session.get('email')
    uid=request.session.get('id')
    if request.method=='POST':
        pform=regiform(request.POST)
        id=regi.objects.get(id=uid)

        if pform.is_valid():
            pform=regiform(request.POST,instance=id)
            pform.save()
            return redirect('/login')
        else:
            print("not update your data")
    else:
        pform=regiform()            
        return render(request,'updateprofile.html',{'pform':pform,'user':user,'rdata':regi.objects.get(id=uid)})


        
def aboutus(request):
    user=request.session.get('email')
    return render(request,'aboutus.html',{'user':user})


def login(request):
    user=request.session.get('email')
    if request.method=='POST':
        if request.POST.get('login')=='login':
            email=request.POST['email']
            password=request.POST['password']
            udata=regi.objects.get(email=email)
            user=regi.objects.filter(email=email,password=password)
            if user:
                request.session['email']=email
                request.session['id']=udata.id
                return redirect('/index')
            else:
                return HttpResponse('your email and password are incorrect')
        else:
            rfrm=regiform(request.POST)
            if rfrm.is_valid():
                rfrm.save()
                # subject = 'welcome to my django project testing'
                # message = f'Hi , thank you for registering in geeksforgeeks.'
                # email_from = settings.EMAIL_HOST_USER 
                # recipient_list = [rfrm.cleaned_data.get('email')] 
                # send_mail( subject, message, email_from, recipient_list ) 
            
                print('Record Inserted!')
                return redirect('/index')
            else:
                print('Record not inserted!')
                print(rfrm.errors)

    else:
        print("dfffdgxfdd")
        rfrm=regiform()


    return render(request,'login.html',{'rfrm':rfrm,'user':user})
  
      









def logoutform(request):
    try:
        del request.session['email']
    except:
        pass
    finally:
        return redirect('/login')

    
def viewfeed(request):
     user=request.session.get('email')    
     feed={'feed_data':feedback.objects.all()}
     return render(request,'viewfeed.html',feed,{'user':user})


def viewregi(request):
    user=request.session.get('email')
    data=regi.objects.all()
    return render(request,'viewregi.html',{'data':data,'user':user})
        
def viewfile(request):
    user=request.session.get('email')
    file_upload=upload.objects.all()
    return render(request,'viewfile.html',{'file_upload':file_upload,'user':user})

def update(request,id):
    if request.method=='POST':
        rform=regiform(request.POST)
        id=regi.objects.get(id=id)

        if rform.is_valid():
            rform=regiform(request.POST,instance=id)
            rform.save()
            return redirect('viewregi')
        else:
            print("not update your data")
    else:
        rform=regiform()            

    return render(request,'update.html',{'rform':rform,'rdata':regi.objects.get(id=id)}) 

def deletefile(request,id):
    fu=upload.objects.get(id=id)
    fu.delete()
    return redirect('viewfile')


def delete(request,id):
    st=regi.objects.get(id=id)
    st.delete()
    return redirect('viewregi')

def deletefeed(request,id):
    fd=feedback.objects.get(id=id)
    fd.delete()
    return redirect('viewfeed')

def contact(request):
    #return HttpResponse("contactus.....")
    user=request.session.get('fnm')
    return render(request,'contact.html',{'user':user})


def home(request):
    user=request.session.get('email')
    return render(request,'home.html',{'user':user})

def upload1(request):
    user=request.session.get('email')
    if request.method=='POST':
        uform=uploadform(request.POST,request.FILES)
        if uform.is_valid():
            uform.save()
            print('upload form')
            return redirect('/')
        else:
            print('not upload')
    else:
        uform=uploadform()
    return render(request,'upload1.html',{'uform':uform,'user':user})          
  
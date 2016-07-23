from django.shortcuts import get_object_or_404, render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views import generic
from django.utils import timezone

from .models import Choice, Question


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """Return the last five published questions (not future questions)."""
        return Question.objects.filter(
                        pub_date__lte=timezone.now()
                        ).order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'

    def get_queryset(self):
        """
        Excludes any questions that are not published yet.
        """
        return Question.objects.filter(pub_date__lte=timezone.now())


class CreateView(generic.CreateView):
    model = Question
    template_name = 'polls/create.html'
    fields = ['question_text', 'pub_date']
    url = 'polls/results.html'
    # TODO: post request is handled here, not custom


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'


def create(request):
    if not request.POST:
        return render(request, 'polls/create.html')

    try:
        text = request.POST['question_text']
        question = Question.objects.create(question_text=text,
                                           pub_date=timezone.now())

        # parse choices
        for i in range(0, 3):
                c_txt = request.POST['choice_' + str(i)]
                question.choice_set.create(choice_text=c_txt)

    except (KeyError):
        return render(request, 'polls/create.html', {
            'error_message': 'An error occurred while creating the poll.'
        })
    else:
        return HttpResponseRedirect(reverse('polls:detail',
                                            args=(question.id,)))


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form
        return render(request, 'polls/detail.html', {
            'question': question, 'error_message': 'No choice was selected.'
        })
    else:
        # TODO: solve race condition using F()
        selected_choice.votes += 1
        selected_choice.save()

        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a user
        # hits the Back button
        # also, use reverse to get the url from the paths
        return HttpResponseRedirect(reverse('polls:results',
                                            args=(question.id,)))

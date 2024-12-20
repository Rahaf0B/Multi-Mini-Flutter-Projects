import 'story.dart';
import '../utilities/constants.dart';

class StoryBrain {
  int _storyIndex = 0;
  final List<Story> _storyData = [
    Story(
        storyTitle:
            'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
        choice1: {
          'value': 'I\'ll hop in. Thanks for the help!',
          'next': '2'
        },
        choice2: {
          'value': 'Better ask him if he\'s a murderer first.',
          'next': '1'
        }),
    Story(storyTitle: 'He nods slowly, unphased by the question.', choice1: {
      'value': 'At least he\'s honest. I\'ll climb in.',
      'next': '2'
    }, choice2: {
      'value': 'Wait, I know how to change a tire.',
      'next': '3'
    }),
    Story(
        storyTitle:
            'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
        choice1: {
          'value': 'I love Elton John! Hand him the cassette tape.',
          'next': '5'
        },
        choice2: {
          'value': 'It\'s him or me! You take the knife and stab him.',
          'next': '4'
        }),
    Story(
        storyTitle:
            'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
        choice1: {'value': 'Restart', 'next': '0'},
        choice2: {'value': '', 'next': ''}),
    Story(
        storyTitle:
            'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
        choice1: {'value': 'Restart', 'next': '0'},
        choice2: {'value': '', 'next': ''}),
    Story(
        storyTitle:
            'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
        choice1: {'value': 'Restart', 'next': '0'},
        choice2: {'value': '', 'next': ''})
  ];

  String getStory() {
    return _storyData[_storyIndex]?.storyTitle ?? "";
  }

  String getChoice1() {
    return _storyData[_storyIndex]?.choice1['value'] ?? "";
  }

  String getChoice2() {
    return _storyData[_storyIndex]?.choice2['value'] ?? "";

    return "";
  }

  void nextStory(Choices choiceNumber) {
    if (choiceNumber == Choices.choice1) {
      if (_storyData[_storyIndex].choice1['next']!.isNotEmpty) {
        _storyIndex = int.parse(_storyData[_storyIndex].choice1['next']!);
      }
    } else if (choiceNumber == Choices.choice2) {
      if (_storyData[_storyIndex].choice2['next']!.isNotEmpty) {
        _storyIndex = int.parse(_storyData[_storyIndex].choice2['next']!);
      }
    }
  }

  bool buttonChoice1ShouldBeVisible() {
    return _storyData[_storyIndex].choice1['value']!.isNotEmpty;
  }

  bool buttonChoice2ShouldBeVisible() {
    return _storyData[_storyIndex].choice2['value']!.isNotEmpty;
  }
}

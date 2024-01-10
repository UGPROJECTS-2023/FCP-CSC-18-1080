import '../models/mentee.dart';
import '../models/mentor.dart';

class MentorMenteeService {
  Map<Mentor, List<Mentee>> mentorMenteePairs = {};

  void assignMentorToMentee(Mentor mentor, Mentee mentee) {
    if (!mentorMenteePairs.containsKey(mentor)) {
      mentorMenteePairs[mentor] = [];
    }
    mentorMenteePairs[mentor]!.add(mentee);
  }

  Map<Mentor, List<Mentee>> getMentorMenteePairs() {
    return mentorMenteePairs;
  }
}

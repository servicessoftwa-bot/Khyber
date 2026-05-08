import 'package:get/get.dart';

class Job {
  final String id, title, company, location, type, category, description;
  final int salaryMin, salaryMax;
  final List<String> skills;
  final String postedDate;
  const Job({required this.id, required this.title, required this.company, required this.location, required this.type, required this.category, required this.description, required this.salaryMin, required this.salaryMax, required this.skills, required this.postedDate});
}

class JobsController extends GetxController {
  final selectedCategory = 'All'.obs;
  final selectedType = 'All'.obs;
  final searchQuery = ''.obs;

  final categories = ['All', 'IT', 'Education', 'Health', 'Engineering', 'Business', 'Govt', 'NGO'];
  final types = ['All', 'Full-time', 'Part-time', 'Contract', 'Internship'];

  final jobs = <Job>[
    Job(id: 'j1', title: 'Flutter Developer', company: 'TechKPK Solutions', location: 'Peshawar', type: 'Full-time', category: 'IT', description: 'Build cross-platform mobile apps using Flutter and Dart for KPK-based clients.', salaryMin: 60000, salaryMax: 120000, skills: ['Flutter', 'Dart', 'Firebase'], postedDate: '2 days ago'),
    Job(id: 'j2', title: 'School Teacher (Mathematics)', company: 'KPK Education Dept', location: 'Mardan', type: 'Full-time', category: 'Education', description: 'Teach mathematics to secondary school students across KPK government schools.', salaryMin: 35000, salaryMax: 55000, skills: ['Teaching', 'Mathematics', 'Communication'], postedDate: '1 week ago'),
    Job(id: 'j3', title: 'Civil Engineer', company: 'NESPAK', location: 'Peshawar', type: 'Contract', category: 'Engineering', description: 'Supervise road and infrastructure construction projects across KPK province.', salaryMin: 80000, salaryMax: 150000, skills: ['AutoCAD', 'Project Management', 'Civil Engineering'], postedDate: '3 days ago'),
    Job(id: 'j4', title: 'Medical Officer', company: 'Lady Reading Hospital', location: 'Peshawar', type: 'Full-time', category: 'Health', description: 'Provide medical care in OPD and emergency departments at LRH Peshawar.', salaryMin: 90000, salaryMax: 160000, skills: ['MBBS', 'Clinical Skills', 'Emergency Medicine'], postedDate: '5 days ago'),
    Job(id: 'j5', title: 'Software Intern', company: 'Arbisoft', location: 'Peshawar', type: 'Internship', category: 'IT', description: 'Assist in software development projects and learn modern web technologies.', salaryMin: 15000, salaryMax: 25000, skills: ['Python', 'JavaScript', 'Problem Solving'], postedDate: '1 day ago'),
    Job(id: 'j6', title: 'Business Development Manager', company: 'Frontier Works', location: 'Abbottabad', type: 'Full-time', category: 'Business', description: 'Drive business growth and manage client relationships in KPK region.', salaryMin: 70000, salaryMax: 130000, skills: ['Sales', 'Negotiation', 'CRM'], postedDate: '4 days ago'),
    Job(id: 'j7', title: 'Data Entry Operator', company: 'KPK IT Board', location: 'Peshawar', type: 'Part-time', category: 'Govt', description: 'Enter and maintain government records in digital databases.', salaryMin: 25000, salaryMax: 35000, skills: ['MS Office', 'Typing', 'Data Entry'], postedDate: '6 days ago'),
    Job(id: 'j8', title: 'Field Coordinator', company: 'UNDP Pakistan', location: 'Swat', type: 'Contract', category: 'NGO', description: 'Coordinate field activities for development projects in Swat and surrounding areas.', salaryMin: 55000, salaryMax: 90000, skills: ['Project Coordination', 'Urdu', 'Pashto'], postedDate: '2 weeks ago'),
  ].obs;

  List<Job> get filteredJobs => jobs.where((j) {
    final matchCat = selectedCategory.value == 'All' || j.category == selectedCategory.value;
    final matchType = selectedType.value == 'All' || j.type == selectedType.value;
    final matchSearch = searchQuery.value.isEmpty || j.title.toLowerCase().contains(searchQuery.value.toLowerCase()) || j.company.toLowerCase().contains(searchQuery.value.toLowerCase());
    return matchCat && matchType && matchSearch;
  }).toList();
}

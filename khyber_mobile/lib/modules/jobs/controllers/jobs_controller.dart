import 'package:get/get.dart';

class Job {
  final String id, title, company, location, type, category, description, image;
  final int salaryMin, salaryMax;
  final List<String> skills;
  final String postedDate;
  const Job({required this.id, required this.title, required this.company, required this.location, required this.type, required this.category, required this.description, required this.image, required this.salaryMin, required this.salaryMax, required this.skills, required this.postedDate});
}

class JobsController extends GetxController {
  final selectedCategory = 'All'.obs;
  final selectedType = 'All'.obs;
  final searchQuery = ''.obs;

  final categories = ['All', 'IT', 'Education', 'Health', 'Engineering', 'Business', 'Govt', 'NGO', 'Trades'];
  final types = ['All', 'Full-time', 'Part-time', 'Contract', 'Internship'];

  final jobs = <Job>[

    // ── IT ──────────────────────────────────────────────────────────────────
    Job(id: 'j1', title: 'Flutter Developer', company: 'TechKPK Solutions', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Build cross-platform mobile apps for KPK-based clients using Flutter, Dart, and Firebase backend services.',
      image: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=300&h=180&fit=crop',
      salaryMin: 60000, salaryMax: 120000, skills: ['Flutter', 'Dart', 'Firebase'], postedDate: '2 days ago'),

    Job(id: 'j2', title: 'React & Node.js Developer', company: 'Innovate Software', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Develop scalable web applications using React frontend and Node.js/Express backend with MongoDB or PostgreSQL.',
      image: 'https://images.unsplash.com/photo-1547658719-da2b51169166?w=300&h=180&fit=crop',
      salaryMin: 70000, salaryMax: 130000, skills: ['React', 'Node.js', 'MongoDB'], postedDate: '1 day ago'),

    Job(id: 'j3', title: 'UI/UX Designer', company: 'Digital Marketing KPK', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Design intuitive interfaces for web and mobile apps — user research, wireframing, prototyping in Figma.',
      image: 'https://images.unsplash.com/photo-1561070791-2526b27b1a0b?w=300&h=180&fit=crop',
      salaryMin: 50000, salaryMax: 100000, skills: ['Figma', 'Adobe XD', 'Prototyping'], postedDate: '3 days ago'),

    Job(id: 'j4', title: 'Cybersecurity Analyst', company: 'KPK IT Board', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Monitor government networks for threats, conduct vulnerability assessments, and enforce security policies.',
      image: 'https://images.unsplash.com/photo-1550751827-4bd374173b43?w=300&h=180&fit=crop',
      salaryMin: 80000, salaryMax: 150000, skills: ['Network Security', 'SIEM', 'CEH'], postedDate: '5 days ago'),

    Job(id: 'j5', title: 'Data Scientist', company: 'TEVTA KPK', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Analyse large datasets to drive policy decisions — ML models, data visualization, and statistical reporting.',
      image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=300&h=180&fit=crop',
      salaryMin: 90000, salaryMax: 160000, skills: ['Python', 'ML', 'Power BI'], postedDate: '4 days ago'),

    Job(id: 'j6', title: 'Backend Python Developer', company: 'ConnectNow Call Center', location: 'Nowshera', type: 'Full-time', category: 'IT',
      description: 'Build and maintain REST APIs using Django REST Framework; manage PostgreSQL databases and cloud deployments.',
      image: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=300&h=180&fit=crop',
      salaryMin: 65000, salaryMax: 115000, skills: ['Python', 'Django', 'PostgreSQL'], postedDate: '1 week ago'),

    Job(id: 'j7', title: 'Network & Systems Engineer', company: 'Khyber IT Solutions', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Install and maintain LAN/WAN infrastructure, CCTV systems, servers, and enterprise Wi-Fi for corporate clients.',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=300&h=180&fit=crop',
      salaryMin: 55000, salaryMax: 100000, skills: ['CCNA', 'Linux', 'Cisco'], postedDate: '6 days ago'),

    Job(id: 'j8', title: 'IT Support Specialist', company: 'SmartHome KPK', location: 'Peshawar', type: 'Part-time', category: 'IT',
      description: 'Provide helpdesk support, troubleshoot hardware/software issues, and manage device setups for home and office clients.',
      image: 'https://images.unsplash.com/photo-1587560699334-bdf57f2c8b01?w=300&h=180&fit=crop',
      salaryMin: 25000, salaryMax: 45000, skills: ['Windows', 'Troubleshooting', 'Networking'], postedDate: '2 days ago'),

    Job(id: 'j9', title: 'Software Engineering Intern', company: 'Arbisoft', location: 'Peshawar', type: 'Internship', category: 'IT',
      description: 'Hands-on internship in agile software development — contribute to real projects using Python, JavaScript, and cloud tools.',
      image: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=300&h=180&fit=crop',
      salaryMin: 15000, salaryMax: 25000, skills: ['Python', 'JavaScript', 'Git'], postedDate: '1 day ago'),

    Job(id: 'j10', title: 'Digital Marketing Executive', company: 'Peshawar Bakehouse', location: 'Peshawar', type: 'Full-time', category: 'IT',
      description: 'Manage social media, run Meta & Google Ad campaigns, produce content, and grow online presence for a food brand.',
      image: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 70000, skills: ['Meta Ads', 'Canva', 'Analytics'], postedDate: '3 days ago'),

    // ── EDUCATION ───────────────────────────────────────────────────────────
    Job(id: 'e1', title: 'Mathematics Teacher (Secondary)', company: 'KPK Education Dept', location: 'Mardan', type: 'Full-time', category: 'Education',
      description: 'Teach mathematics from Grade 6 to 10 in government secondary school — syllabus planning and student assessment required.',
      image: 'https://images.unsplash.com/photo-1580582932707-520aed937b7b?w=300&h=180&fit=crop',
      salaryMin: 35000, salaryMax: 55000, skills: ['Mathematics', 'Teaching', 'Assessment'], postedDate: '1 week ago'),

    Job(id: 'e2', title: 'University Lecturer (Computer Science)', company: 'University of Peshawar', location: 'Peshawar', type: 'Full-time', category: 'Education',
      description: 'Deliver undergraduate lectures in Data Structures, Algorithms, and OOP; conduct research and supervise final year projects.',
      image: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=300&h=180&fit=crop',
      salaryMin: 70000, salaryMax: 120000, skills: ['CS Degree', 'Research', 'Lecturing'], postedDate: '2 weeks ago'),

    Job(id: 'e3', title: 'English Language Teacher', company: 'KPK English Language Institute', location: 'Peshawar', type: 'Full-time', category: 'Education',
      description: 'Teach IELTS preparation, spoken English, and business communication — small classes, modern teaching methodology.',
      image: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 65000, skills: ['IELTS', 'TEFL', 'Communication'], postedDate: '4 days ago'),

    Job(id: 'e4', title: 'Science Teacher (O-Level)', company: 'Gandhara Academy', location: 'Peshawar', type: 'Full-time', category: 'Education',
      description: 'Teach Cambridge O-Level Physics and Chemistry, prepare students for CIE exams, and conduct practical lab sessions.',
      image: 'https://images.unsplash.com/photo-1434030216411-0b793f4b6ac9?w=300&h=180&fit=crop',
      salaryMin: 50000, salaryMax: 80000, skills: ['CIE O-Level', 'Physics', 'Chemistry'], postedDate: '5 days ago'),

    Job(id: 'e5', title: 'Special Education Teacher', company: 'Swat Institute of Technology', location: 'Swat', type: 'Full-time', category: 'Education',
      description: 'Provide inclusive education support for students with learning disabilities — IEP development and classroom adaptation.',
      image: 'https://images.unsplash.com/photo-1535982359261-9f1a6f530e02?w=300&h=180&fit=crop',
      salaryMin: 38000, salaryMax: 60000, skills: ['Special Ed', 'IEP', 'Patience'], postedDate: '3 days ago'),

    Job(id: 'e6', title: 'School Principal', company: 'Brain Academy Mardan', location: 'Mardan', type: 'Full-time', category: 'Education',
      description: 'Lead academic operations, manage teaching staff, liaise with parents, and drive quality improvement across the school.',
      image: 'https://images.unsplash.com/photo-1531482615290-82dbf6e5f0a3?w=300&h=180&fit=crop',
      salaryMin: 80000, salaryMax: 130000, skills: ['Leadership', 'Administration', 'Education'], postedDate: '1 week ago'),

    // ── HEALTH ──────────────────────────────────────────────────────────────
    Job(id: 'h1', title: 'Medical Officer (OPD)', company: 'Lady Reading Hospital', location: 'Peshawar', type: 'Full-time', category: 'Health',
      description: 'Provide outpatient consultations, manage ward rounds, and assist in emergency procedures at LRH Peshawar.',
      image: 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=300&h=180&fit=crop',
      salaryMin: 90000, salaryMax: 160000, skills: ['MBBS', 'Clinical Skills', 'Emergency'], postedDate: '5 days ago'),

    Job(id: 'h2', title: 'Registered Nurse', company: 'Al-Shifa Medical Complex', location: 'Peshawar', type: 'Full-time', category: 'Health',
      description: 'Provide patient care in surgical ward — medication administration, vital monitoring, wound care, and patient education.',
      image: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=300&h=180&fit=crop',
      salaryMin: 35000, salaryMax: 60000, skills: ['Nursing', 'Patient Care', 'IV Therapy'], postedDate: '2 days ago'),

    Job(id: 'h3', title: 'Pharmacist', company: 'City Pharmacy Mardan', location: 'Mardan', type: 'Full-time', category: 'Health',
      description: 'Dispense medicines, counsel patients on drug interactions, manage inventory, and liaise with doctors and suppliers.',
      image: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 70000, skills: ['Pharm-D', 'Drug Knowledge', 'Inventory'], postedDate: '1 week ago'),

    Job(id: 'h4', title: 'Dentist (BDS)', company: 'Smile Dental Care', location: 'Peshawar', type: 'Full-time', category: 'Health',
      description: 'Perform general dental procedures — extractions, fillings, root canals, and cosmetic whitening for a busy private clinic.',
      image: 'https://images.unsplash.com/photo-1606811971618-4486d14f3f99?w=300&h=180&fit=crop',
      salaryMin: 60000, salaryMax: 110000, skills: ['BDS', 'Extractions', 'Orthodontics'], postedDate: '3 days ago'),

    Job(id: 'h5', title: 'Medical Lab Technologist', company: 'Lady Reading Outpatient Clinic', location: 'Peshawar', type: 'Full-time', category: 'Health',
      description: 'Perform haematology, biochemistry, and microbiology tests; maintain lab equipment and ensure quality standards.',
      image: 'https://images.unsplash.com/photo-1579154341184-a0b45b9e949b?w=300&h=180&fit=crop',
      salaryMin: 35000, salaryMax: 55000, skills: ['MLT', 'Haematology', 'Biochemistry'], postedDate: '6 days ago'),

    Job(id: 'h6', title: 'Physiotherapist', company: 'FitZone Gym & Spa', location: 'Peshawar', type: 'Part-time', category: 'Health',
      description: 'Assess and treat patients with musculoskeletal injuries, provide rehabilitation plans, and guide exercise therapy.',
      image: 'https://images.unsplash.com/photo-1571019614242-c5c5dee81260?w=300&h=180&fit=crop',
      salaryMin: 30000, salaryMax: 55000, skills: ['Physiotherapy', 'Rehab', 'Exercise Therapy'], postedDate: '4 days ago'),

    // ── ENGINEERING ─────────────────────────────────────────────────────────
    Job(id: 'en1', title: 'Civil Engineer (Roads)', company: 'NESPAK', location: 'Peshawar', type: 'Contract', category: 'Engineering',
      description: 'Supervise road and highway construction projects across KPK — site inspection, quality control, and progress reporting.',
      image: 'https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=300&h=180&fit=crop',
      salaryMin: 80000, salaryMax: 150000, skills: ['AutoCAD', 'Road Design', 'Project Management'], postedDate: '3 days ago'),

    Job(id: 'en2', title: 'Electrical Engineer', company: 'PESCO', location: 'Peshawar', type: 'Full-time', category: 'Engineering',
      description: 'Design and maintain power distribution systems, conduct load analysis, and oversee grid upgrade projects in KPK.',
      image: 'https://images.unsplash.com/photo-1621905251189-8186ded80b21?w=300&h=180&fit=crop',
      salaryMin: 75000, salaryMax: 140000, skills: ['Power Systems', 'AutoCAD', 'ETAP'], postedDate: '1 week ago'),

    Job(id: 'en3', title: 'Mechanical Engineer', company: 'Frontier Works Organisation', location: 'Abbottabad', type: 'Full-time', category: 'Engineering',
      description: 'Design and maintain heavy machinery for construction projects — preventive maintenance plans, spare parts management.',
      image: 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=300&h=180&fit=crop',
      salaryMin: 70000, salaryMax: 130000, skills: ['Mechanical Design', 'SolidWorks', 'Maintenance'], postedDate: '5 days ago'),

    Job(id: 'en4', title: 'Structural Engineer', company: 'Peshawar Development Authority', location: 'Peshawar', type: 'Full-time', category: 'Engineering',
      description: 'Review and approve structural drawings, conduct site inspections, and ensure building codes compliance for KPK projects.',
      image: 'https://images.unsplash.com/photo-1503387762-592deb58ef4e?w=300&h=180&fit=crop',
      salaryMin: 85000, salaryMax: 155000, skills: ['ETABS', 'SAP2000', 'Building Codes'], postedDate: '2 weeks ago'),

    Job(id: 'en5', title: 'Environmental Engineer', company: 'EPA KPK', location: 'Peshawar', type: 'Full-time', category: 'Engineering',
      description: 'Conduct environmental impact assessments for industrial projects, monitor air and water quality across KPK.',
      image: 'https://images.unsplash.com/photo-1560732488-6b0df9cf8939?w=300&h=180&fit=crop',
      salaryMin: 65000, salaryMax: 115000, skills: ['EIA', 'GIS', 'Environmental Law'], postedDate: '4 days ago'),

    Job(id: 'en6', title: 'Solar Energy Technician', company: 'SmartHome KPK', location: 'Peshawar', type: 'Full-time', category: 'Engineering',
      description: 'Install and maintain residential and commercial solar panel systems — inverter setup, battery storage, and after-sales support.',
      image: 'https://images.unsplash.com/photo-1509391366360-2e959784a276?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 75000, skills: ['Solar PV', 'Inverters', 'Electrical'], postedDate: '2 days ago'),

    // ── BUSINESS ────────────────────────────────────────────────────────────
    Job(id: 'b1', title: 'Business Development Manager', company: 'Frontier Works', location: 'Abbottabad', type: 'Full-time', category: 'Business',
      description: 'Drive revenue growth, identify new markets, and manage enterprise client relationships across the KPK region.',
      image: 'https://images.unsplash.com/photo-1497366216548-37526070297c?w=300&h=180&fit=crop',
      salaryMin: 70000, salaryMax: 130000, skills: ['Sales', 'Negotiation', 'CRM'], postedDate: '4 days ago'),

    Job(id: 'b2', title: 'Accountant / Finance Officer', company: 'Pearl Continental Peshawar', location: 'Peshawar', type: 'Full-time', category: 'Business',
      description: 'Manage financial statements, payroll, tax filings, and monthly reporting for a large hospitality operation.',
      image: 'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=300&h=180&fit=crop',
      salaryMin: 55000, salaryMax: 95000, skills: ['Accounting', 'QuickBooks', 'Tax'], postedDate: '6 days ago'),

    Job(id: 'b3', title: 'Marketing Manager', company: 'Metro Cash & Carry', location: 'Peshawar', type: 'Full-time', category: 'Business',
      description: 'Plan and execute marketing campaigns, manage brand presence, analyse market trends, and coordinate with the retail team.',
      image: 'https://images.unsplash.com/photo-1551434678-e076c223a692?w=300&h=180&fit=crop',
      salaryMin: 65000, salaryMax: 110000, skills: ['Marketing', 'Brand', 'Campaigns'], postedDate: '3 days ago'),

    Job(id: 'b4', title: 'HR Officer', company: 'Hayatabad Shopping Mall', location: 'Peshawar', type: 'Full-time', category: 'Business',
      description: 'Manage recruitment, employee relations, performance appraisals, and HR compliance for 200+ mall employees.',
      image: 'https://images.unsplash.com/photo-1521737852567-6949f3f9f2b5?w=300&h=180&fit=crop',
      salaryMin: 45000, salaryMax: 80000, skills: ['HR', 'Recruitment', 'Labour Law'], postedDate: '5 days ago'),

    Job(id: 'b5', title: 'Sales Executive', company: 'Frontier Property Dealers', location: 'Peshawar', type: 'Full-time', category: 'Business',
      description: 'Generate property leads, conduct site visits with clients, negotiate deals, and close residential and commercial sales.',
      image: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a9d8?w=300&h=180&fit=crop',
      salaryMin: 35000, salaryMax: 80000, skills: ['Sales', 'Real Estate', 'Client Management'], postedDate: '1 day ago'),

    Job(id: 'b6', title: 'Hotel Operations Manager', company: 'Serena Hotel Swat', location: 'Swat', type: 'Full-time', category: 'Business',
      description: 'Oversee front desk, housekeeping, F&B, and guest services teams — ensure 5-star service standards across all departments.',
      image: 'https://images.unsplash.com/photo-1455587734955-081b22074882?w=300&h=180&fit=crop',
      salaryMin: 80000, salaryMax: 140000, skills: ['Hospitality', 'Operations', 'Leadership'], postedDate: '1 week ago'),

    // ── GOVT ────────────────────────────────────────────────────────────────
    Job(id: 'g1', title: 'Data Entry Operator', company: 'KPK IT Board', location: 'Peshawar', type: 'Part-time', category: 'Govt',
      description: 'Enter and verify government records into digital databases — accuracy, confidentiality, and speed required.',
      image: 'https://images.unsplash.com/photo-1497366811353-6870744d04b2?w=300&h=180&fit=crop',
      salaryMin: 25000, salaryMax: 35000, skills: ['MS Office', 'Typing', 'Data Entry'], postedDate: '6 days ago'),

    Job(id: 'g2', title: 'Revenue Officer', company: 'Board of Revenue KPK', location: 'Peshawar', type: 'Full-time', category: 'Govt',
      description: 'Manage land records, process property mutations, resolve revenue disputes, and maintain accurate patwari records.',
      image: 'https://images.unsplash.com/photo-1554224155-6726b3ff858f?w=300&h=180&fit=crop',
      salaryMin: 45000, salaryMax: 75000, skills: ['Revenue Law', 'Land Records', 'Urdu'], postedDate: '2 weeks ago'),

    Job(id: 'g3', title: 'Police Sub-Inspector', company: 'KPK Police', location: 'Mardan', type: 'Full-time', category: 'Govt',
      description: 'Lead a police unit in crime prevention, investigation, and community policing in Mardan district.',
      image: 'https://images.unsplash.com/photo-1589391886645-d51941080237?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 65000, skills: ['Law Enforcement', 'Investigation', 'Leadership'], postedDate: '1 week ago'),

    Job(id: 'g4', title: 'Junior Clerk (BPS-11)', company: 'Deputy Commissioner Office', location: 'Abbottabad', type: 'Full-time', category: 'Govt',
      description: 'Handle official correspondence, file management, scheduling, and general administrative duties for the DC office.',
      image: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=180&fit=crop',
      salaryMin: 28000, salaryMax: 42000, skills: ['MS Office', 'Filing', 'Administration'], postedDate: '3 days ago'),

    Job(id: 'g5', title: 'Agriculture Extension Officer', company: 'Dept of Agriculture KPK', location: 'Charsadda', type: 'Full-time', category: 'Govt',
      description: 'Train farmers on modern cultivation, seed distribution, pest control, and irrigation techniques to boost yields.',
      image: 'https://images.unsplash.com/photo-1574943320219-553eb213f72d?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 65000, skills: ['Agronomy', 'Extension Services', 'Training'], postedDate: '4 days ago'),

    // ── NGO ─────────────────────────────────────────────────────────────────
    Job(id: 'n1', title: 'Field Coordinator', company: 'UNDP Pakistan', location: 'Swat', type: 'Contract', category: 'NGO',
      description: 'Coordinate field activities for development and flood relief projects in Swat — community engagement and reporting.',
      image: 'https://images.unsplash.com/photo-1469571486292-0ba58a3f068b?w=300&h=180&fit=crop',
      salaryMin: 55000, salaryMax: 90000, skills: ['Project Coordination', 'Urdu', 'Pashto'], postedDate: '2 weeks ago'),

    Job(id: 'n2', title: 'Community Health Worker', company: 'WHO Pakistan', location: 'Kohat', type: 'Contract', category: 'NGO',
      description: 'Deliver vaccination campaigns, maternal health education, and primary care services to rural communities in Kohat.',
      image: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=300&h=180&fit=crop',
      salaryMin: 30000, salaryMax: 50000, skills: ['Health Education', 'Community Outreach', 'Pashto'], postedDate: '1 week ago'),

    Job(id: 'n3', title: 'Program Manager (Education)', company: 'UNICEF Pakistan', location: 'Peshawar', type: 'Full-time', category: 'NGO',
      description: 'Manage education-in-emergencies programming across KPK — donor reporting, partner coordination, and field monitoring.',
      image: 'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=300&h=180&fit=crop',
      salaryMin: 120000, salaryMax: 200000, skills: ['Program Management', 'Donor Reporting', 'Education'], postedDate: '5 days ago'),

    Job(id: 'n4', title: 'M&E Officer', company: 'Save the Children', location: 'Peshawar', type: 'Full-time', category: 'NGO',
      description: 'Design monitoring frameworks, collect field data, analyse programme results, and produce M&E reports for donors.',
      image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=300&h=180&fit=crop',
      salaryMin: 75000, salaryMax: 130000, skills: ['M&E', 'KoBoToolbox', 'SPSS'], postedDate: '3 days ago'),

    Job(id: 'n5', title: 'Social Mobilizer', company: 'Mercy Corps', location: 'Mansehra', type: 'Contract', category: 'NGO',
      description: 'Engage communities in livelihood and DRR projects in Mansehra — household visits, awareness sessions, and data collection.',
      image: 'https://images.unsplash.com/photo-1521737711867-e3b97375f902?w=300&h=180&fit=crop',
      salaryMin: 25000, salaryMax: 40000, skills: ['Community Work', 'Pashto', 'Data Collection'], postedDate: '4 days ago'),

    Job(id: 'n6', title: 'WASH Engineer', company: 'Action Against Hunger', location: 'DI Khan', type: 'Contract', category: 'NGO',
      description: 'Design and supervise water sanitation and hygiene infrastructure in underserved communities of south KPK.',
      image: 'https://images.unsplash.com/photo-1560732488-6b0df9cf8939?w=300&h=180&fit=crop',
      salaryMin: 65000, salaryMax: 110000, skills: ['WASH', 'Civil Engineering', 'Borehole'], postedDate: '6 days ago'),

    // ── TRADES ──────────────────────────────────────────────────────────────
    Job(id: 'tr1', title: 'Master Electrician', company: 'HomeFixPro Peshawar', location: 'Peshawar', type: 'Full-time', category: 'Trades',
      description: 'Handle domestic and commercial wiring, load balancing, inverter installation, and fault diagnosis across Peshawar.',
      image: 'https://images.unsplash.com/photo-1621905251189-8186ded80b21?w=300&h=180&fit=crop',
      salaryMin: 35000, salaryMax: 65000, skills: ['Wiring', 'Inverters', 'Safety'], postedDate: '2 days ago'),

    Job(id: 'tr2', title: 'AC & Refrigeration Technician', company: 'HomeFixPro Peshawar', location: 'Peshawar', type: 'Full-time', category: 'Trades',
      description: 'Install, service, and repair split ACs, inverter units, and commercial refrigeration systems — HVAC certification preferred.',
      image: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=300&h=180&fit=crop',
      salaryMin: 30000, salaryMax: 60000, skills: ['HVAC', 'AC Repair', 'Refrigerant'], postedDate: '1 day ago'),

    Job(id: 'tr3', title: 'Experienced Driver (Heavy Vehicle)', company: 'Cargo & Freight KPK', location: 'Peshawar', type: 'Full-time', category: 'Trades',
      description: 'Drive 20-ton freight trucks on national highways — valid HTV licence, clean record, and two years experience required.',
      image: 'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=300&h=180&fit=crop',
      salaryMin: 40000, salaryMax: 70000, skills: ['HTV Licence', 'Driving', 'Navigation'], postedDate: '3 days ago'),

    Job(id: 'tr4', title: 'Carpenter & Wood Carver', company: 'Mardan Wood Carving Studio', location: 'Mardan', type: 'Full-time', category: 'Trades',
      description: 'Craft high-quality furniture and decorative wood pieces in walnut and sheesham — chisel, lathe, and CNC skills needed.',
      image: 'https://images.unsplash.com/photo-1565343052-1b7e83dddbd4?w=300&h=180&fit=crop',
      salaryMin: 30000, salaryMax: 55000, skills: ['Carpentry', 'Carving', 'Walnut Work'], postedDate: '5 days ago'),

    Job(id: 'tr5', title: 'Chef (Pakistani & Continental)', company: 'Green Valley Restaurant Swat', location: 'Swat', type: 'Full-time', category: 'Trades',
      description: 'Prepare traditional Swati dishes and continental menu items — experience in karahi, trout, and grills required.',
      image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=300&h=180&fit=crop',
      salaryMin: 35000, salaryMax: 60000, skills: ['Cooking', 'Menu Planning', 'Kitchen Management'], postedDate: '1 week ago'),

    Job(id: 'tr6', title: 'Welder & Fabricator', company: 'Frontier Works Organisation', location: 'Nowshera', type: 'Full-time', category: 'Trades',
      description: 'Perform MIG/TIG welding and metal fabrication for construction and heavy engineering projects across KPK.',
      image: 'https://images.unsplash.com/photo-1504328345606-18bbc8c9d7d1?w=300&h=180&fit=crop',
      salaryMin: 32000, salaryMax: 58000, skills: ['MIG Welding', 'TIG Welding', 'Fabrication'], postedDate: '2 days ago'),

  ].obs;

  List<Job> get filteredJobs => jobs.where((j) {
    final matchCat = selectedCategory.value == 'All' || j.category == selectedCategory.value;
    final matchType = selectedType.value == 'All' || j.type == selectedType.value;
    final q = searchQuery.value.toLowerCase();
    final matchSearch = q.isEmpty ||
      j.title.toLowerCase().contains(q) ||
      j.company.toLowerCase().contains(q) ||
      j.location.toLowerCase().contains(q) ||
      j.category.toLowerCase().contains(q) ||
      j.skills.any((s) => s.toLowerCase().contains(q));
    return matchCat && matchType && matchSearch;
  }).toList();
}

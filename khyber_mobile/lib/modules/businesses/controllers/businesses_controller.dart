import 'package:get/get.dart';

class Business {
  final String id, name, category, area, phone, description, image;
  final double rating;
  final bool isVerified, isOpen;
  final List<String> tags;
  const Business({
    required this.id, required this.name, required this.category,
    required this.area, required this.phone, required this.description,
    required this.image, required this.rating, required this.isVerified,
    required this.isOpen, required this.tags,
  });
}

class BusinessesController extends GetxController {
  final selectedCategory = 'All'.obs;
  final searchQuery = ''.obs;

  final categories = ['All', 'Food', 'Retail', 'Services', 'Health', 'Education', 'Tech', 'Crafts', 'Hotels', 'Transport'];

  final businesses = <Business>[

    // ── FOOD ────────────────────────────────────────────────────────────────
    Business(id: 'f1', name: 'Khyber Darbar Restaurant', category: 'Food',
      area: 'Saddar, Peshawar', phone: '091-1234567',
      description: 'Authentic Peshawari cuisine — Chapli Kabab, Karahi, and traditional breads baked in clay ovens since 1985.',
      image: 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: true, isOpen: true, tags: ['Dine-in', 'Takeaway', 'Halal']),

    Business(id: 'f2', name: 'Namak Mandi Chapli Kabab', category: 'Food',
      area: 'Namak Mandi, Peshawar', phone: '0300-1234500',
      description: 'World-famous Peshawari Chapli Kababs grilled over charcoal — the must-try street food landmark of Peshawar.',
      image: 'https://images.unsplash.com/photo-1544025162-d76538a3fc0c?w=400&h=200&fit=crop',
      rating: 4.9, isVerified: true, isOpen: true, tags: ['BBQ', 'Street Food', 'Famous']),

    Business(id: 'f3', name: 'Frontier Sweets & Ice Cream', category: 'Food',
      area: 'Qissa Khwani, Peshawar', phone: '091-2223344',
      description: 'Legendary Peshawari ice cream, Mithai, and traditional sweets made from pure milk and desi ghee since 1962.',
      image: 'https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400&h=200&fit=crop',
      rating: 4.9, isVerified: true, isOpen: true, tags: ['Sweets', 'Ice Cream', 'Traditional']),

    Business(id: 'f4', name: 'Peshawar Bakehouse', category: 'Food',
      area: 'University Road, Peshawar', phone: '091-3334455',
      description: 'Fresh breads, cakes, pastries, and Peshawari naan baked daily. Catering orders accepted for events.',
      image: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: true, tags: ['Bakery', 'Cakes', 'Catering']),

    Business(id: 'f5', name: 'Student Biryani (Hayatabad)', category: 'Food',
      area: 'Phase 4, Hayatabad, Peshawar', phone: '0311-2345678',
      description: 'The most popular biryani spot among students and families — aromatic KPK-style biryani at unbeatable prices.',
      image: 'https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: false, isOpen: true, tags: ['Biryani', 'Delivery', 'Budget']),

    Business(id: 'f6', name: 'Green Valley Restaurant (Swat)', category: 'Food',
      area: 'Mingora, Swat', phone: '0946-123456',
      description: 'Beautiful hilltop restaurant serving traditional Swati trout, malai karahi, and fresh juices with mountain views.',
      image: 'https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Trout', 'View', 'Traditional']),

    Business(id: 'f7', name: 'Abbottabad Food Street', category: 'Food',
      area: 'Jinnah Road, Abbottabad', phone: '0992-345678',
      description: 'Open-air food street with 20+ stalls offering BBQ, grills, desi food, and local specialties from Hazara region.',
      image: 'https://images.unsplash.com/photo-1565557623262-b51206a09d62?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: false, isOpen: false, tags: ['Street Food', 'BBQ', 'Variety']),

    Business(id: 'f8', name: 'Mardan Puri House', category: 'Food',
      area: 'GT Road, Mardan', phone: '0937-234567',
      description: 'The go-to spot for authentic halwa puri, chana, and breakfast favorites — serving Mardan since 1978.',
      image: 'https://images.unsplash.com/photo-1585937421612-70a008356fbe?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: false, isOpen: true, tags: ['Breakfast', 'Puri', 'Desi']),

    Business(id: 'f9', name: 'Nara Café & Juice Bar', category: 'Food',
      area: 'Cantt, Peshawar', phone: '0323-9871234',
      description: 'Specialty coffees, fresh fruit juices, healthy salads, and light snacks — the top café hangout in Peshawar.',
      image: 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: true, isOpen: true, tags: ['Café', 'Coffee', 'Juice']),

    Business(id: 'f10', name: 'Kohat Desi Dhaba', category: 'Food',
      area: 'Kohat Road, Kohat', phone: '0922-111222',
      description: 'No-frills roadside dhaba famous for slow-cooked daal, hand-rolled roti, and butter chicken that draws travelers from miles around.',
      image: 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: false, isOpen: true, tags: ['Dhaba', 'Daal', 'Roadside']),

    Business(id: 'f11', name: 'Mansehra Kabab Corner', category: 'Food',
      area: 'Main Bazaar, Mansehra', phone: '0997-222333',
      description: 'Hazara-style seekh kababs, tikka, and charsi karahi — perfect after a trek through the Kaghan Valley.',
      image: 'https://images.unsplash.com/photo-1529193591184-b1d58069ecdd?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: false, isOpen: true, tags: ['Kabab', 'Tikka', 'Karahi']),

    Business(id: 'f12', name: 'Frontier Pizza & Burgers', category: 'Food',
      area: 'Hayatabad Phase 6, Peshawar', phone: '0300-5556667',
      description: 'Best fast food in KPK — hand-stretched pizzas, gourmet burgers, and loaded fries made fresh to order.',
      image: 'https://images.unsplash.com/photo-1513104890138-7c749659a591?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: true, isOpen: true, tags: ['Pizza', 'Burgers', 'Fast Food']),

    // ── RETAIL ──────────────────────────────────────────────────────────────
    Business(id: 'r1', name: 'Metro Cash & Carry', category: 'Retail',
      area: 'Hayatabad, Peshawar', phone: '091-9876543',
      description: 'KPK\'s largest wholesale and retail store with over 10,000 products at competitive prices.',
      image: 'https://images.unsplash.com/photo-1534723452862-4c874986ebad?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: true, tags: ['Wholesale', 'Retail', 'Grocery']),

    Business(id: 'r2', name: 'Hayatabad Shopping Mall', category: 'Retail',
      area: 'Phase 5, Hayatabad, Peshawar', phone: '091-8889990',
      description: 'Multi-floor shopping destination with 80+ stores — fashion, electronics, food court, kids\' zone, and cinema.',
      image: 'https://images.unsplash.com/photo-1519046904884-53103b34b206?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: true, isOpen: true, tags: ['Mall', 'Fashion', 'Food Court']),

    Business(id: 'r3', name: 'Bara Electronics Market', category: 'Retail',
      area: 'Bara Road, Peshawar', phone: '0334-2223334',
      description: 'The biggest electronics and mobile phone market in KPK — genuine and imported items at the best prices.',
      image: 'https://images.unsplash.com/photo-1588702547919-b31a7b2c823b?w=400&h=200&fit=crop',
      rating: 4.1, isVerified: false, isOpen: true, tags: ['Electronics', 'Mobile', 'Import']),

    Business(id: 'r4', name: 'Noor Tailor & Boutique', category: 'Retail',
      area: 'Namak Mandi, Peshawar', phone: '0345-6667778',
      description: 'Custom stitching for traditional and modern wear — Shalwar Kameez, Sherwanis, and Ladies outfits with Peshwari flair.',
      image: 'https://images.unsplash.com/photo-1441984904996-e0b6ba687e04?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: false, isOpen: true, tags: ['Tailoring', 'Traditional', 'Custom']),

    Business(id: 'r5', name: 'Qissa Khwani Old City Books', category: 'Retail',
      area: 'Qissa Khwani Bazaar, Peshawar', phone: '091-1112233',
      description: 'Historic bookshop selling rare manuscripts, Pashto literature, Islamic books, and educational texts since 1947.',
      image: 'https://images.unsplash.com/photo-1481627834876-b7833e8f5570?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: false, isOpen: true, tags: ['Books', 'Rare', 'Islamic']),

    Business(id: 'r6', name: 'Peshawari Chappal Makers', category: 'Retail',
      area: 'Mohabbat Khan, Peshawar', phone: '0312-3334445',
      description: 'Hand-crafted Peshawari chappals — the iconic leather sandals loved across Pakistan and exported worldwide.',
      image: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Handmade', 'Leather', 'Export']),

    Business(id: 'r7', name: 'Charsadda Textile Market', category: 'Retail',
      area: 'Main Bazaar, Charsadda', phone: '0938-112233',
      description: 'Wholesale and retail fabrics — lawn, chiffon, silk, and Khadi at factory prices direct from Charsadda mills.',
      image: 'https://images.unsplash.com/photo-1558769132-cb1aea153895?w=400&h=200&fit=crop',
      rating: 4.2, isVerified: false, isOpen: true, tags: ['Fabric', 'Wholesale', 'Textile']),

    Business(id: 'r8', name: 'City Pharmacy (Mardan)', category: 'Retail',
      area: 'Katlang Road, Mardan', phone: '0937-445566',
      description: 'Fully stocked pharmacy with genuine medicines, supplements, medical equipment, and qualified dispensers available 24/7.',
      image: 'https://images.unsplash.com/photo-1584308666744-24d5c474f2ae?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: true, tags: ['Medicine', '24/7', 'Pharmacy']),

    Business(id: 'r9', name: 'Nowshera Farmers Market', category: 'Retail',
      area: 'Nowshera Bypass, Nowshera', phone: '0923-334455',
      description: 'Direct-from-farm produce — seasonal vegetables, fruits, and dairy products fresh every morning from local growers.',
      image: 'https://images.unsplash.com/photo-1488459716781-31db52582fe9?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: false, isOpen: false, tags: ['Fresh', 'Organic', 'Farm']),

    // ── SERVICES ────────────────────────────────────────────────────────────
    Business(id: 's1', name: 'Peshawar Auto Services', category: 'Services',
      area: 'Ring Road, Peshawar', phone: '0311-9990001',
      description: 'Complete vehicle repair, servicing, and car wash facility with Japanese-trained certified mechanics.',
      image: 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: false, isOpen: true, tags: ['Repair', 'Service', 'Car Wash']),

    Business(id: 's2', name: 'Elite Salon & Barber (Hayatabad)', category: 'Services',
      area: 'Phase 1, Hayatabad, Peshawar', phone: '0323-7778889',
      description: 'Premium grooming salon offering haircuts, beard styling, facial treatments, and spa services for men and women.',
      image: 'https://images.unsplash.com/photo-1562322140-8baeececf3df?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['Salon', 'Grooming', 'Spa']),

    Business(id: 's3', name: 'KPK Photography & Events', category: 'Services',
      area: 'Saddar, Peshawar', phone: '0300-8889990',
      description: 'Professional photography, videography, and full event management for weddings, corporate events, and ceremonies.',
      image: 'https://images.unsplash.com/photo-1554048612-b6a482bc67e5?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: true, isOpen: true, tags: ['Photography', 'Events', 'Wedding']),

    Business(id: 's4', name: 'Frontier Property Dealers', category: 'Services',
      area: 'University Road, Peshawar', phone: '0345-0001112',
      description: 'Trusted real estate agency with 20 years of experience — buying, selling, and renting properties across KPK.',
      image: 'https://images.unsplash.com/photo-1560518883-ce09059eeffa?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: true, isOpen: true, tags: ['Real Estate', 'Property', 'Rental']),

    Business(id: 's5', name: 'Quick Laundry Express', category: 'Services',
      area: 'Cantt, Peshawar', phone: '0313-2223334',
      description: 'Same-day dry cleaning and laundry service with home pickup and delivery — modern equipment, eco-friendly detergents.',
      image: 'https://images.unsplash.com/photo-1582735689369-4fe89db7114c?w=400&h=200&fit=crop',
      rating: 4.2, isVerified: false, isOpen: true, tags: ['Laundry', 'Pickup', 'Same-Day']),

    Business(id: 's6', name: 'Swat Tourism & Travel Agency', category: 'Services',
      area: 'Mingora, Swat', phone: '0946-987654',
      description: 'Complete travel packages to Swat, Kalam, Malam Jabba, Kumrat, and Chitral — jeep safaris, trekking, and hotel booking.',
      image: 'https://images.unsplash.com/photo-1501555088652-021faa106b9b?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Travel', 'Trekking', 'Tours']),

    Business(id: 's7', name: 'HomeFixPro (Peshawar)', category: 'Services',
      area: 'Hayatabad, Peshawar', phone: '0322-4445556',
      description: 'Plumbing, electrical, AC repair, painting, and general home maintenance — certified technicians, same-day response.',
      image: 'https://images.unsplash.com/photo-1581578731548-c64695cc6952?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: false, isOpen: true, tags: ['Plumbing', 'Electrical', 'AC']),

    Business(id: 's8', name: 'Grand Event Planners KPK', category: 'Services',
      area: 'Saddar, Peshawar', phone: '0312-6667778',
      description: 'Full wedding and event planning — décor, catering coordination, lighting, entertainment, and venue booking across KPK.',
      image: 'https://images.unsplash.com/photo-1540575467537-40ef34cd7cd5?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['Wedding', 'Decor', 'Events']),

    Business(id: 's9', name: 'Print & Design Studio', category: 'Services',
      area: 'GT Road, Nowshera', phone: '0923-556677',
      description: 'Business cards, banners, branding materials, and large-format printing — fast turnaround with design support included.',
      image: 'https://images.unsplash.com/photo-1588666309990-d68f08e3d4a6?w=400&h=200&fit=crop',
      rating: 4.1, isVerified: false, isOpen: true, tags: ['Printing', 'Design', 'Branding']),

    // ── HEALTH ──────────────────────────────────────────────────────────────
    Business(id: 'h1', name: 'Al-Shifa Medical Complex', category: 'Health',
      area: 'Kohat Road, Peshawar', phone: '091-5554321',
      description: 'Multi-specialty hospital with 24/7 emergency, OPD, diagnostic labs, pharmacy, and 200+ specialist doctors.',
      image: 'https://images.unsplash.com/photo-1586773860418-d37222d8fce3?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['Hospital', '24/7', 'Emergency']),

    Business(id: 'h2', name: 'Lady Reading Outpatient Clinic', category: 'Health',
      area: 'Phase 5, Hayatabad, Peshawar', phone: '091-9264601',
      description: 'Specialist consultations in cardiology, orthopaedics, gynecology, and paediatrics by LRH consultant doctors.',
      image: 'https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: true, tags: ['Specialists', 'OPD', 'Labs']),

    Business(id: 'h3', name: 'Smile Dental Care (Hayatabad)', category: 'Health',
      area: 'Phase 2, Hayatabad, Peshawar', phone: '0314-1112223',
      description: 'Modern dental clinic offering teeth whitening, orthodontics, implants, and cosmetic dentistry with digital X-ray.',
      image: 'https://images.unsplash.com/photo-1606811971618-4486d14f3f99?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: true, isOpen: true, tags: ['Dental', 'Implants', 'Whitening']),

    Business(id: 'h4', name: 'FitZone Gym & Spa', category: 'Health',
      area: 'University Road, Peshawar', phone: '0333-5556667',
      description: 'State-of-the-art gym with Olympic equipment, personal trainers, steam room, sauna, and nutrition counselling.',
      image: 'https://images.unsplash.com/photo-1534438327276-14e5300c3a48?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['Gym', 'Fitness', 'Trainers']),

    Business(id: 'h5', name: 'Clear Vision Eye Centre', category: 'Health',
      area: 'Saddar, Peshawar', phone: '091-2225566',
      description: 'Eye examinations, LASIK surgery, contact lenses, and spectacles — experienced ophthalmologists with latest equipment.',
      image: 'https://images.unsplash.com/photo-1516912481800-557d4c3a1d73?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: true, tags: ['Eye Care', 'LASIK', 'Lenses']),

    Business(id: 'h6', name: 'Mardan Shifa Medical Hall', category: 'Health',
      area: 'Katlang Chowk, Mardan', phone: '0937-778899',
      description: 'Comprehensive pharmacy and homeopathic medicine store — imported medicines, lab referrals, and free BP check.',
      image: 'https://images.unsplash.com/photo-1471864190281-a93a3070b6de?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: false, isOpen: true, tags: ['Pharmacy', 'Homeopathic', 'Lab']),

    Business(id: 'h7', name: 'Safe Maternity & Child Clinic', category: 'Health',
      area: 'Ring Road, Peshawar', phone: '0311-8889900',
      description: 'Specialised maternity care, antenatal clinics, neonatal unit, and complete child health services under one roof.',
      image: 'https://images.unsplash.com/photo-1559757148-5c350d0d3c56?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Maternity', 'Pediatrics', 'Antenatal']),

    // ── EDUCATION ───────────────────────────────────────────────────────────
    Business(id: 'e1', name: 'Gandhara Academy', category: 'Education',
      area: 'Warsak Road, Peshawar', phone: '091-7778899',
      description: 'Premier private school offering O-Level, A-Level, and HSSC programs with state-of-the-art science labs and sports facilities.',
      image: 'https://images.unsplash.com/photo-1580582932707-520aed937b7b?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: false, tags: ['O-Level', 'A-Level', 'HSSC']),

    Business(id: 'e2', name: 'University of Peshawar', category: 'Education',
      area: 'Jamrud Road, Peshawar', phone: '091-9216751',
      description: 'KPK\'s oldest and most prestigious university — 50+ departments, research labs, and a historic 1600-acre campus.',
      image: 'https://images.unsplash.com/photo-1523050854058-8df90110c9f1?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['University', 'Research', 'Public']),

    Business(id: 'e3', name: 'COMSATS University (Abbottabad)', category: 'Education',
      area: 'Tobe Camp, Abbottabad', phone: '0992-383591',
      description: 'Leading tech university with CS, Engineering, Business, and Biosciences programs — modern campus, top-ranked faculty.',
      image: 'https://images.unsplash.com/photo-1498243691581-b192e3fd8f2a?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: true, isOpen: true, tags: ['Engineering', 'CS', 'Campus']),

    Business(id: 'e4', name: 'Frontier Coaching Academy', category: 'Education',
      area: 'Saddar, Peshawar', phone: '091-4445566',
      description: 'MDCAT, ECAT, CSS, and board exam preparation — 98% pass rate with experienced subject specialists.',
      image: 'https://images.unsplash.com/photo-1434030216411-0b793f4b6ac9?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['MDCAT', 'ECAT', 'CSS']),

    Business(id: 'e5', name: 'KPK English Language Institute', category: 'Education',
      area: 'Hayatabad, Peshawar', phone: '0332-3334445',
      description: 'IELTS, TOEFL, and spoken English courses for students, professionals, and visa applicants — batch and one-on-one classes.',
      image: 'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['IELTS', 'TOEFL', 'English']),

    Business(id: 'e6', name: 'Brain Academy Mardan', category: 'Education',
      area: 'Main Bazaar, Mardan', phone: '0937-122334',
      description: 'Quality tutoring from Matric to Intermediate and competitive exam prep — small batches ensure personalised attention.',
      image: 'https://images.unsplash.com/photo-1531482615290-82dbf6e5f0a3?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: false, isOpen: true, tags: ['Tutoring', 'Matric', 'FSc']),

    Business(id: 'e7', name: 'Swat Institute of Technology', category: 'Education',
      area: 'Mingora, Swat', phone: '0946-543210',
      description: 'Vocational and technical training — electrician, plumbing, auto-mechanic, and IT diplomas recognised by TEVTA.',
      image: 'https://images.unsplash.com/photo-1593642632559-0c6d3fc62b89?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: true, isOpen: true, tags: ['TEVTA', 'Vocational', 'Diplomas']),

    // ── TECH ────────────────────────────────────────────────────────────────
    Business(id: 't1', name: 'Tech Peshawar Hub', category: 'Tech',
      area: 'University Road, Peshawar', phone: '0300-1111222',
      description: 'Premier IT incubation, training, and co-working space — nurturing KPK\'s next generation of software startups.',
      image: 'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Incubation', 'Training', 'Startup']),

    Business(id: 't2', name: 'Digital Marketing KPK', category: 'Tech',
      area: 'Cantt, Peshawar', phone: '0323-1112223',
      description: 'Social media, SEO, Google Ads, and complete digital marketing solutions driving measurable growth for local brands.',
      image: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['SEO', 'Social Media', 'Ads']),

    Business(id: 't3', name: 'Innovate Software (Peshawar)', category: 'Tech',
      area: 'Hayatabad Phase 7, Peshawar', phone: '0322-5556667',
      description: 'Custom software, mobile apps, and ERP solutions for SMEs across KPK — agile delivery with post-launch support.',
      image: 'https://images.unsplash.com/photo-1547658719-da2b51169166?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: true, isOpen: true, tags: ['Apps', 'ERP', 'Custom']),

    Business(id: 't4', name: 'ConnectNow Call Center', category: 'Tech',
      area: 'GT Road, Nowshera', phone: '0923-778899',
      description: 'BPO and customer support services — inbound, outbound, and live chat support for businesses across Pakistan and abroad.',
      image: 'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?w=400&h=200&fit=crop',
      rating: 4.2, isVerified: false, isOpen: true, tags: ['BPO', 'Call Center', 'Support']),

    Business(id: 't5', name: 'Gamer\'s Arena (Hayatabad)', category: 'Tech',
      area: 'Phase 4, Hayatabad, Peshawar', phone: '0333-0001113',
      description: 'KPK\'s best gaming cafe with high-end PCs, PS5 consoles, VR headsets, fast internet, and monthly esports tournaments.',
      image: 'https://images.unsplash.com/photo-1542751371-adc38448a05e?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: false, isOpen: true, tags: ['Gaming', 'Esports', 'VR']),

    Business(id: 't6', name: 'Khyber IT Solutions', category: 'Tech',
      area: 'Saddar, Peshawar', phone: '091-8880001',
      description: 'Laptop and PC repair, data recovery, networking, CCTV installation, and IT hardware supply for offices and homes.',
      image: 'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: true, isOpen: true, tags: ['Repair', 'Networking', 'CCTV']),

    Business(id: 't7', name: 'SmartHome KPK', category: 'Tech',
      area: 'University Road, Peshawar', phone: '0312-4445557',
      description: 'Home automation, smart lighting, solar monitoring, IP cameras, and Alexa/Google Home integration for modern homes.',
      image: 'https://images.unsplash.com/photo-1558002038-1055907df827?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['Automation', 'Solar', 'Smart']),

    // ── CRAFTS ──────────────────────────────────────────────────────────────
    Business(id: 'c1', name: 'KPK Handloom & Crafts', category: 'Crafts',
      area: 'Bara Market, Peshawar', phone: '0333-4445556',
      description: 'Authentic Peshawari chappals, Chitral wool shawls, and hand-woven Khadi fabrics exported to Europe and the Gulf.',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: false, isOpen: true, tags: ['Handmade', 'Export', 'Shawls']),

    Business(id: 'c2', name: 'Swat Pottery & Ceramics', category: 'Crafts',
      area: 'Mingora, Swat', phone: '0946-456789',
      description: 'Traditional Swati blue pottery — handcrafted vases, plates, and decorative tiles painted with centuries-old techniques.',
      image: 'https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: false, isOpen: true, tags: ['Pottery', 'Ceramic', 'Handmade']),

    Business(id: 'c3', name: 'Peshawar Carpet Palace', category: 'Crafts',
      area: 'Qissa Khwani, Peshawar', phone: '091-3330001',
      description: 'Finest hand-knotted Afghan and Persian rugs — thousands of designs in silk, wool, and cotton for home and export.',
      image: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Carpets', 'Rugs', 'Afghan']),

    Business(id: 'c4', name: 'Tribal Afghan Jewelry Market', category: 'Crafts',
      area: 'Karkhano Market, Peshawar', phone: '0300-2223334',
      description: 'Antique and handcrafted tribal jewelry — silver, lapis lazuli, turquoise, and traditional Afghan ornaments.',
      image: 'https://images.unsplash.com/photo-1573408301185-9519f94f4aca?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: false, isOpen: true, tags: ['Jewelry', 'Tribal', 'Silver']),

    Business(id: 'c5', name: 'Mardan Wood Carving Studio', category: 'Crafts',
      area: 'Industrial Estate, Mardan', phone: '0937-334455',
      description: 'Intricate wood carving — doors, screens, furniture, and decorative panels in walnut and sheesham for homes and export.',
      image: 'https://images.unsplash.com/photo-1565343052-1b7e83dddbd4?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: false, isOpen: true, tags: ['Wood', 'Walnut', 'Furniture']),

    Business(id: 'c6', name: 'Khyber Embroidery & Needlework', category: 'Crafts',
      area: 'Saddar, Peshawar', phone: '0345-7778889',
      description: 'Pashto phulkari embroidery on dress material, cushion covers, and wall hangings — custom orders for weddings and gifts.',
      image: 'https://images.unsplash.com/photo-1591085686374-7d0f0d8e62ca?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: false, isOpen: true, tags: ['Embroidery', 'Phulkari', 'Custom']),

    // ── HOTELS ──────────────────────────────────────────────────────────────
    Business(id: 'ho1', name: 'Pearl Continental Peshawar', category: 'Hotels',
      area: 'Khyber Road, Peshawar', phone: '091-5276361',
      description: 'Peshawar\'s flagship 5-star hotel — 148 rooms, rooftop dining, outdoor pool, full spa, and conference facilities.',
      image: 'https://images.unsplash.com/photo-1455587734955-081b22074882?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: true, isOpen: true, tags: ['5-Star', 'Pool', 'Conference']),

    Business(id: 'ho2', name: 'Serena Hotel Swat', category: 'Hotels',
      area: 'Saidu Sharif, Swat', phone: '0946-710221',
      description: 'Heritage luxury hotel surrounded by mountains — beautifully designed rooms, local cuisine restaurant, and garden terrace.',
      image: 'https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?w=400&h=200&fit=crop',
      rating: 4.8, isVerified: true, isOpen: true, tags: ['Luxury', 'Heritage', 'Mountain']),

    Business(id: 'ho3', name: 'Pine Park Hotel (Abbottabad)', category: 'Hotels',
      area: 'Mansehra Road, Abbottabad', phone: '0992-336641',
      description: 'Comfortable mid-range hotel in the heart of Abbottabad — family rooms, restaurant, parking, and close to Ayub Park.',
      image: 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: true, isOpen: true, tags: ['Family', 'Abbottabad', 'Budget']),

    Business(id: 'ho4', name: 'Malam Jabba Resort', category: 'Hotels',
      area: 'Malam Jabba, Swat', phone: '0946-765432',
      description: 'Ski resort hotel on the snow-covered peaks of Malam Jabba — chairlift access, ski school, chalet-style rooms.',
      image: 'https://images.unsplash.com/photo-1520250497591-112f2f40a3f4?w=400&h=200&fit=crop',
      rating: 4.6, isVerified: true, isOpen: true, tags: ['Ski', 'Resort', 'Snow']),

    Business(id: 'ho5', name: 'Naran Lalazar Hotel', category: 'Hotels',
      area: 'Main Bazar, Naran', phone: '0997-412233',
      description: 'Charming riverside hotel in Naran — wooden interiors, valley views, bonfire nights, and proximity to Lake Saiful Maluk.',
      image: 'https://images.unsplash.com/photo-1464037866556-6812c9d1c72e?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: false, isOpen: true, tags: ['River View', 'Kaghan', 'Nature']),

    Business(id: 'ho6', name: 'One Bed & Breakfast (Peshawar)', category: 'Hotels',
      area: 'Hayatabad Phase 3, Peshawar', phone: '0333-8880002',
      description: 'Cozy boutique guesthouse with home-cooked breakfast, fast Wi-Fi, and warm Peshawari hospitality — perfect for solo travellers.',
      image: 'https://images.unsplash.com/photo-1586611292717-f828b167408c?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: false, isOpen: true, tags: ['Boutique', 'B&B', 'Wi-Fi']),

    // ── TRANSPORT ───────────────────────────────────────────────────────────
    Business(id: 'tr1', name: 'Skyways Bus Service', category: 'Transport',
      area: 'General Bus Stand, Peshawar', phone: '091-5230001',
      description: 'Luxury AC coaches connecting Peshawar to Lahore, Islamabad, Karachi, and all major KPK districts — online booking available.',
      image: 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=400&h=200&fit=crop',
      rating: 4.3, isVerified: true, isOpen: true, tags: ['Bus', 'AC', 'Inter-city']),

    Business(id: 'tr2', name: 'Peshawar Rent A Car', category: 'Transport',
      area: 'Saddar, Peshawar', phone: '0300-9876001',
      description: 'Daily, weekly, and monthly car rental with driver option — Corolla, Prado, Coaster, and 4WD vehicles for tourism and corporate use.',
      image: 'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=400&h=200&fit=crop',
      rating: 4.5, isVerified: true, isOpen: true, tags: ['Car Hire', 'Tourism', 'Corporate']),

    Business(id: 'tr3', name: 'Swat Valley Jeep Safari', category: 'Transport',
      area: 'Fizagat, Swat', phone: '0946-234567',
      description: '4x4 jeep tours to Ushu, Utror, Gabral, Mahodand Lake, and Kalam — experienced mountain drivers, group packages available.',
      image: 'https://images.unsplash.com/photo-1533591380348-14193f1de18f?w=400&h=200&fit=crop',
      rating: 4.7, isVerified: false, isOpen: true, tags: ['Jeep', '4x4', 'Safari']),

    Business(id: 'tr4', name: 'Cargo & Freight KPK', category: 'Transport',
      area: 'Industrial Estate, Peshawar', phone: '091-2340001',
      description: 'Reliable goods transport connecting KPK to all Pakistan — refrigerated, flatbed, and container trucks with GPS tracking.',
      image: 'https://images.unsplash.com/photo-1601584115197-04ecc0da31d7?w=400&h=200&fit=crop',
      rating: 4.2, isVerified: true, isOpen: true, tags: ['Cargo', 'Freight', 'GPS']),

    Business(id: 'tr5', name: 'Express Courier Peshawar', category: 'Transport',
      area: 'Cantt, Peshawar', phone: '091-5559900',
      description: 'Same-day local delivery and next-day inter-city courier — parcels, documents, and bulk shipments with real-time tracking.',
      image: 'https://images.unsplash.com/photo-1526367790999-0150786686a2?w=400&h=200&fit=crop',
      rating: 4.4, isVerified: true, isOpen: true, tags: ['Courier', 'Same-Day', 'Tracking']),

  ].obs;

  List<Business> get filtered => businesses.where((b) {
    final matchCat = selectedCategory.value == 'All' || b.category == selectedCategory.value;
    final q = searchQuery.value.toLowerCase();
    final matchSearch = q.isEmpty ||
      b.name.toLowerCase().contains(q) ||
      b.area.toLowerCase().contains(q) ||
      b.category.toLowerCase().contains(q) ||
      b.tags.any((t) => t.toLowerCase().contains(q));
    return matchCat && matchSearch;
  }).toList();
}

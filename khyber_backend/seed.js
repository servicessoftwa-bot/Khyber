require('dotenv').config();
const mongoose = require('mongoose');
const Restaurant       = require('./src/models/Restaurant');
const GroceryProduct   = require('./src/models/GroceryProduct');
const Medicine         = require('./src/models/Medicine');
const ShoppingProduct  = require('./src/models/ShoppingProduct');
const Craft            = require('./src/models/Craft');
const TourismSpot      = require('./src/models/TourismSpot');
const NewsArticle      = require('./src/models/NewsArticle');
const Park             = require('./src/models/Park');
const AmusementPlace   = require('./src/models/AmusementPlace');
const EducationInstitution = require('./src/models/EducationInstitution');
const Hospital         = require('./src/models/Hospital');
const EmergencyService = require('./src/models/EmergencyService');
const HomeNursingService = require('./src/models/HomeNursingService');
const TransportRoute   = require('./src/models/TransportRoute');
const CourierCompany   = require('./src/models/CourierCompany');
const LogisticsProvider= require('./src/models/LogisticsProvider');
const RealEstateListing= require('./src/models/RealEstateListing');
const GovtService      = require('./src/models/GovtService');
const WaterGasProvider = require('./src/models/WaterGasProvider');
const Hotel            = require('./src/models/Hotel');
const Job              = require('./src/models/Job');
const Business         = require('./src/models/Business');
const Event            = require('./src/models/Event');

async function seed() {
  await mongoose.connect(process.env.MONGODB_URI);
  console.log('Connected to MongoDB');
  await Promise.all([
    Restaurant.deleteMany({}), GroceryProduct.deleteMany({}),
    Medicine.deleteMany({}), ShoppingProduct.deleteMany({}),
    Craft.deleteMany({}), TourismSpot.deleteMany({}),
    NewsArticle.deleteMany({}), Park.deleteMany({}),
    AmusementPlace.deleteMany({}), EducationInstitution.deleteMany({}),
    Hospital.deleteMany({}), EmergencyService.deleteMany({}),
    HomeNursingService.deleteMany({}), TransportRoute.deleteMany({}),
    CourierCompany.deleteMany({}), LogisticsProvider.deleteMany({}),
    RealEstateListing.deleteMany({}), GovtService.deleteMany({}),
    WaterGasProvider.deleteMany({}), Hotel.deleteMany({}),
    Job.deleteMany({}), Business.deleteMany({}), Event.deleteMany({}),
  ]);
  console.log('Cleared all collections');

  await Restaurant.insertMany([
    { name: 'Charsi Tikka', cuisine: 'Pashtun', description: 'Famous Namak Mandi mutton karahi, cooking since 1947.', location: 'Namak Mandi, Peshawar', district: 'Peshawar', rating: 4.9, reviews: 3200, priceRange: 'moderate', isOpen: true, phone: '091-2564123', deliveryAvailable: false, featured: true },
    { name: 'Peshawari Chapli House', cuisine: 'Pashtun', description: 'Authentic chapli kabab with pomegranate seeds.', location: 'Qissa Khwani Bazaar, Peshawar', district: 'Peshawar', rating: 4.7, reviews: 1850, priceRange: 'cheap', isOpen: true, phone: '091-2561890', deliveryAvailable: true, featured: true },
    { name: 'Jan Daal Restaurant', cuisine: 'Pashtun', description: 'Slow-cooked daal, fresh naan and lamb pulao.', location: 'Hayatabad Phase 3, Peshawar', district: 'Peshawar', rating: 4.5, reviews: 980, priceRange: 'cheap', isOpen: true, phone: '091-5813422', deliveryAvailable: true },
    { name: 'Monal KPK', cuisine: 'Continental', description: 'Rooftop dining with panoramic city views.', location: 'Warsak Road, Peshawar', district: 'Peshawar', rating: 4.4, reviews: 720, priceRange: 'expensive', isOpen: true, phone: '091-5893001', deliveryAvailable: false },
    { name: 'Sabri Nihari', cuisine: 'Pashtun', description: 'Slow-cooked nihari and paye since 1980, open from 6am.', location: 'Saddar Road, Peshawar', district: 'Peshawar', rating: 4.6, reviews: 1540, priceRange: 'cheap', isOpen: true, phone: '091-2526711', deliveryAvailable: false },
    { name: 'Shinwari Hotel Landi Kotal', cuisine: 'Pashtun', description: 'Traditional Shinwari lamb karahi near the Khyber Pass.', location: 'Landi Kotal Bazaar', district: 'Khyber', rating: 4.8, reviews: 2100, priceRange: 'moderate', isOpen: true, phone: '091-7780123', deliveryAvailable: false, featured: true },
  ]);

  await GroceryProduct.insertMany([
    { name: 'Basmati Rice (5kg)', category: 'Rice & Grains', price: 1200, unit: 'bag', storeName: 'Al-Fatah Grocers', district: 'Peshawar', inStock: true, brand: 'Guard', featured: true },
    { name: 'Sunflower Oil (3L)', category: 'Oils & Ghee', price: 950, unit: 'bottle', storeName: 'Metro Cash & Carry', district: 'Peshawar', inStock: true, brand: 'Sufi' },
    { name: 'Fresh Tomatoes', category: 'Vegetables', price: 80, unit: 'kg', storeName: 'Namak Mandi Sabzi Market', district: 'Peshawar', inStock: true },
    { name: 'Desi Chicken (whole)', category: 'Meat & Poultry', price: 750, unit: 'piece', storeName: 'Hayatabad Poultry', district: 'Peshawar', inStock: true, featured: true },
    { name: 'Atta Flour (10kg)', category: 'Rice & Grains', price: 1400, unit: 'bag', storeName: 'Al-Fatah Grocers', district: 'Peshawar', inStock: true, brand: 'Bake Parlor' },
    { name: 'Fresh Milk (1L)', category: 'Dairy', price: 160, unit: 'litre', storeName: 'Dairy Farm Direct', district: 'Peshawar', inStock: true },
    { name: 'Desi Ghee (1kg)', category: 'Oils & Ghee', price: 2200, unit: 'kg', storeName: 'Saddar Market', district: 'Peshawar', inStock: true, featured: true },
    { name: 'Eggs (30 pcs)', category: 'Dairy', price: 620, unit: 'dozen', storeName: 'Hayatabad Poultry', district: 'Peshawar', inStock: true },
  ]);

  await Medicine.insertMany([
    { name: 'Panadol 500mg', category: 'Painkiller', description: 'Paracetamol for fever and pain.', price: 35, unit: 'strip (10 tabs)', manufacturer: 'GSK Pakistan', requiresPrescription: false, inStock: true, pharmacyName: 'D-Watson Pharmacy', district: 'Peshawar' },
    { name: 'Augmentin 625mg', category: 'Antibiotic', description: 'Amoxicillin+Clavulanate broad-spectrum antibiotic.', price: 320, unit: 'strip (6 tabs)', manufacturer: 'GSK Pakistan', requiresPrescription: true, inStock: true, pharmacyName: 'City Pharmacy Saddar', district: 'Peshawar' },
    { name: 'ORS Sachet', category: 'Rehydration', description: 'Oral rehydration salts for dehydration.', price: 20, unit: 'sachet', manufacturer: 'Otsuka Pakistan', requiresPrescription: false, inStock: true, pharmacyName: 'HMC Pharmacy', district: 'Peshawar' },
    { name: 'Brufen 400mg', category: 'Painkiller', description: 'Ibuprofen for pain, inflammation and fever.', price: 45, unit: 'strip (10 tabs)', manufacturer: 'Abbott Pakistan', requiresPrescription: false, inStock: true, pharmacyName: 'D-Watson Pharmacy', district: 'Peshawar' },
    { name: 'Metformin 500mg', category: 'Diabetes', description: 'First-line medication for type 2 diabetes.', price: 95, unit: 'strip (20 tabs)', manufacturer: 'Getz Pharma', requiresPrescription: true, inStock: true, pharmacyName: 'City Pharmacy Saddar', district: 'Peshawar' },
    { name: 'Vitamin C 500mg', category: 'Vitamin', description: 'Ascorbic acid supplement for immunity.', price: 120, unit: 'bottle (60 tabs)', manufacturer: 'Herbion', requiresPrescription: false, inStock: true, pharmacyName: 'D-Watson Pharmacy', district: 'Peshawar' },
    { name: 'Omeprazole 20mg', category: 'Gastro', description: 'Proton pump inhibitor for acid reflux.', price: 140, unit: 'strip (14 caps)', manufacturer: 'Ferozsons', requiresPrescription: false, inStock: true, pharmacyName: 'HMC Pharmacy', district: 'Peshawar' },
  ]);

  await ShoppingProduct.insertMany([
    { name: 'Peshawari Chappal (Men)', category: 'Footwear', description: 'Hand-crafted leather sandals, traditional design.', price: 2500, originalPrice: 3200, shopName: 'Qissa Khwani Leather Works', district: 'Peshawar', inStock: true, featured: true },
    { name: 'Embroidered Shawl', category: 'Clothing', description: 'Kashmiri-style hand-embroidered wool shawl.', price: 4500, originalPrice: 5500, shopName: 'Saddar Cloth Market', district: 'Peshawar', inStock: true, featured: true },
    { name: 'Shalwar Kameez (Men)', category: 'Clothing', description: 'Lawn fabric, traditional Peshawari cut.', price: 1800, originalPrice: 2200, shopName: 'Benazir Market', district: 'Peshawar', inStock: true },
    { name: 'Dry Fruit Mix (500g)', category: 'Food & Snacks', description: 'Premium mix of almonds, walnuts, raisins.', price: 850, originalPrice: 1000, shopName: 'Qissa Khwani Dry Fruits', district: 'Peshawar', inStock: true, featured: true },
    { name: 'Copper Teapot (Samovar)', category: 'Home Decor', description: 'Hand-beaten copper Peshawari samovar.', price: 3500, originalPrice: 4200, shopName: 'Copper Bazaar Peshawar', district: 'Peshawar', inStock: true },
    { name: 'Android Smart TV 43"', category: 'Electronics', description: 'Full HD Android smart TV.', price: 55000, originalPrice: 62000, shopName: 'Tech Zone Hayatabad', district: 'Peshawar', inStock: true },
  ]);

  await Craft.insertMany([
    { name: 'Kalash Embroidered Cap', artisan: 'Gul Bano Craftworks', category: 'embroidery', description: 'Colorful hand-embroidered Kalash cap from Chitral.', price: 1800, district: 'Chitral', rating: 4.8, inStock: true, featured: true },
    { name: 'Blue Pottery Vase', artisan: 'Multani Ceramics KPK', category: 'pottery', description: 'Traditional blue glazed ceramic vase.', price: 2200, district: 'Peshawar', rating: 4.6, inStock: true, featured: true },
    { name: 'Swati Woodwork Box', artisan: 'Swat Woodcraft', category: 'woodwork', description: 'Intricately carved walnut wood jewelry box from Swat.', price: 4500, district: 'Swat', rating: 4.9, inStock: true, featured: true },
    { name: 'Peshawari Namda (Felt Rug)', artisan: 'Namda Weavers Collective', category: 'weaving', description: 'Hand-felted wool rug with geometric patterns.', price: 6500, district: 'Peshawar', rating: 4.7, inStock: true },
    { name: 'Lapis Lazuli Necklace', artisan: 'Khyber Gems', category: 'jewelry', description: 'Natural lapis lazuli set in oxidised silver.', price: 8000, district: 'Peshawar', rating: 4.8, inStock: true, featured: true },
    { name: 'Pashto Calligraphy Frame', artisan: 'Khushal Khan Arts', category: 'calligraphy', description: 'Framed Pashto calligraphy verse by Khushal Khan Khattak.', price: 3200, district: 'Nowshera', rating: 4.5, inStock: true },
  ]);

  console.log('Seeded: Restaurants, Grocery, Medicines, Shopping, Crafts');

  await TourismSpot.insertMany([
    { name: 'Mahabat Khan Mosque', category: 'historical', description: 'Mughal-era mosque in old Peshawar, famous for intricate frescoes.', location: 'Qissa Khwani Bazaar, Peshawar', district: 'Peshawar', rating: 4.8, reviews: 2800, entryFee: 0, openingHours: '5am-10pm', bestSeason: 'Oct-Mar' },
    { name: 'Bala Hisar Fort', category: 'historical', description: '17th-century fort overlooking Peshawar, home to the Frontier Corps Museum.', location: 'Peshawar Cantonment', district: 'Peshawar', rating: 4.6, reviews: 1900, entryFee: 50, openingHours: '9am-5pm', bestSeason: 'Oct-Mar' },
    { name: 'Khyber Pass', category: 'historical', description: 'Legendary mountain pass connecting Pakistan to Afghanistan.', location: 'Landi Kotal', district: 'Khyber', rating: 4.9, reviews: 4200, entryFee: 0, bestSeason: 'Oct-Apr' },
    { name: 'Swat Valley', category: 'natural', description: 'The Switzerland of Pakistan - lush green valleys and snow-capped peaks.', location: 'Mingora, Swat', district: 'Swat', rating: 4.9, reviews: 12000, entryFee: 0, openingHours: 'Open 24h', bestSeason: 'May-Sep' },
    { name: 'Takht Bahi Buddhist Ruins', category: 'historical', description: 'UNESCO World Heritage site - 1st century Gandharan Buddhist monastery.', location: 'Takht Bahi, Mardan', district: 'Mardan', rating: 4.7, reviews: 3100, entryFee: 100, openingHours: '8am-5pm', bestSeason: 'Oct-Mar' },
    { name: 'Chitral Valley', category: 'natural', description: 'Remote valley with Tirich Mir peak, home to the Kalash people.', location: 'Chitral', district: 'Chitral', rating: 4.9, reviews: 5800, entryFee: 0, bestSeason: 'Jun-Sep' },
    { name: 'Kalam & Mahodand Lake', category: 'natural', description: 'Alpine lake at 3000m with crystal clear water and pine forests.', location: 'Kalam, Upper Swat', district: 'Swat', rating: 4.8, reviews: 6700, entryFee: 0, bestSeason: 'Jun-Aug' },
    { name: 'Qissa Khwani Bazaar', category: 'cultural', description: 'The Storytellers Bazaar - historic market street in old Peshawar.', location: 'Old City, Peshawar', district: 'Peshawar', rating: 4.7, reviews: 3900, entryFee: 0, openingHours: '9am-10pm', bestSeason: 'Oct-Mar' },
  ]);

  await NewsArticle.insertMany([
    { title: 'KPK Government Launches New Tourism Drive for Swat Valley', category: 'local', source: 'Dawn News', publishedAt: new Date('2026-05-10'), summary: 'The KPK Tourism Authority launched a summer campaign to attract 500,000 visitors to Swat this season.' },
    { title: 'Peshawar BRT Expansion to Nowshera Approved', category: 'local', source: 'The News International', publishedAt: new Date('2026-05-09'), summary: 'Provincial cabinet approved a PKR 18 billion extension of the BRT system to Nowshera.' },
    { title: 'University of Peshawar Ranked Among Top 500 Asian Universities', category: 'education', source: 'ARY News', publishedAt: new Date('2026-05-08'), summary: 'UoP has entered the QS Asia Rankings for the first time.' },
    { title: 'KPK Wheat Procurement Campaign Exceeds Target by 20%', category: 'business', source: 'Business Recorder', publishedAt: new Date('2026-05-07'), summary: 'The province procured 1.2 million metric tons of wheat, surpassing the 1 million ton target.' },
    { title: 'Hayatabad Medical Complex Gets New ICU Wing', category: 'health', source: 'Geo News', publishedAt: new Date('2026-05-06'), summary: 'A 60-bed state-of-the-art ICU wing inaugurated at HMC.' },
    { title: 'Peshawar Zalmi Win PSL Finals', category: 'sports', source: 'ESPN Cricinfo', publishedAt: new Date('2026-05-05'), summary: 'Zalmi defeated Karachi Kings by 8 wickets before a 30,000-strong crowd.' },
  ]);

  await Park.insertMany([
    { name: 'Wazir Bagh', description: 'Historic Mughal-era garden with rose gardens and walking tracks.', location: 'Wazir Bagh Road, Peshawar', district: 'Peshawar', facilities: ['Walking Track', 'Rose Garden', 'Play Area', 'Parking'], rating: 4.4, entryFee: 20, openingHours: '6am-8pm', isOpen: true },
    { name: 'Shahi Bagh Public Park', description: 'Large public park with a small zoo and boat lake.', location: 'Shahi Bagh, Peshawar', district: 'Peshawar', facilities: ['Boating Lake', 'Mini Zoo', 'Cafeteria', 'Jogging Track', 'Kids Rides'], rating: 4.2, entryFee: 30, openingHours: '7am-9pm', isOpen: true },
    { name: 'Hayatabad Sports Complex Grounds', description: 'Manicured lawns adjacent to the sports complex.', location: 'Hayatabad Phase 6, Peshawar', district: 'Peshawar', facilities: ['Open Lawn', 'Walking Path', 'Parking'], rating: 4.0, entryFee: 0, openingHours: '5am-10pm', isOpen: true },
    { name: 'Marghazar Zoo & Park', description: 'Combined zoo and botanical park - popular family destination.', location: 'Peshawar Ring Road', district: 'Peshawar', facilities: ['Zoo', 'Botanical Garden', 'Cafeteria', 'Picnic Area'], rating: 4.1, entryFee: 50, openingHours: '8am-7pm', isOpen: true },
  ]);

  await AmusementPlace.insertMany([
    { name: 'Fun City Peshawar', category: 'games', description: 'Indoor gaming zone with rides, bowling and arcade games.', location: 'Hayatabad Phase 4, Peshawar', district: 'Peshawar', rating: 4.3, priceRange: 'PKR 500-2000 per person', openingHours: '11am-11pm', isOpen: true, phone: '091-5892211' },
    { name: 'Cinepax Peshawar', category: 'cinema', description: 'Multiplex cinema with 4 screens, 3D hall, full concessions.', location: 'University Town, Peshawar', district: 'Peshawar', rating: 4.5, priceRange: 'PKR 600-1200 per ticket', openingHours: '11am-12am', isOpen: true, phone: '091-5703030' },
    { name: 'Khyber Go-Kart Track', category: 'sports', description: 'Professional go-kart racing circuit, helmet and gear included.', location: 'Ring Road, Peshawar', district: 'Peshawar', rating: 4.4, priceRange: 'PKR 800 for 10 mins', openingHours: '3pm-11pm', isOpen: true, phone: '0300-9123456' },
    { name: 'Swat Safari Park', category: 'park', description: 'Wildlife safari and adventure park in Swat with zip lining.', location: 'Mingora, Swat', district: 'Swat', rating: 4.6, priceRange: 'PKR 300-1500 per activity', openingHours: '9am-6pm', isOpen: true, phone: '0946-712233' },
  ]);

  console.log('Seeded: Tourism, News, Parks, Amusement');

  await EducationInstitution.insertMany([
    { name: 'University of Peshawar', type: 'university', description: 'Established 1950, premier public university with 150+ programs.', location: 'University Road, Peshawar', district: 'Peshawar', contact: '091-9216701', rating: 4.5, established: 1950, affiliation: 'HEC Pakistan', programs: ['BS', 'MS', 'PhD', 'MBA', 'LLB'] },
    { name: 'UET Peshawar', type: 'university', description: 'University of Engineering and Technology - leading engineering institution in KPK.', location: 'GT Road, Peshawar', district: 'Peshawar', contact: '091-9216290', rating: 4.6, established: 1980, affiliation: 'HEC Pakistan', programs: ['BE Civil', 'BE Electrical', 'BE Computer', 'MS', 'PhD'] },
    { name: 'Islamia College Peshawar', type: 'college', description: 'Historic college established 1913, autonomous university status since 2008.', location: 'Islamia Road, Peshawar', district: 'Peshawar', contact: '091-9216601', rating: 4.4, established: 1913, affiliation: 'HEC Pakistan', programs: ['BS', 'MS', 'Intermediate'] },
    { name: 'Army Public School Peshawar', type: 'school', description: 'Leading O/A Level school affiliated with Cambridge International.', location: 'Warsak Road, Peshawar', district: 'Peshawar', contact: '091-5703100', rating: 4.7, established: 1978, affiliation: 'Cambridge / FBISE', programs: ['O Level', 'A Level', 'Matric', 'FSc'] },
    { name: 'CECOS University', type: 'university', description: 'Private university focused on engineering, business and computing.', location: 'Hayatabad Phase 6, Peshawar', district: 'Peshawar', contact: '091-5812011', rating: 4.3, established: 2002, affiliation: 'HEC Pakistan', programs: ['BS Computer Science', 'BS Software Engineering', 'BBA', 'MBA'] },
    { name: 'Edwardes College Peshawar', type: 'college', description: 'Elite college established 1900, FSc and BS programs.', location: 'Peshawar Cantonment', district: 'Peshawar', contact: '091-5272786', rating: 4.5, established: 1900, affiliation: 'University of Peshawar', programs: ['Intermediate', 'BS', 'BBA'] },
  ]);

  await Hospital.insertMany([
    { name: 'Hayatabad Medical Complex (HMC)', type: 'public', description: 'Largest public hospital in KPK, 1300-bed tertiary care facility.', location: 'Phase 7, Hayatabad, Peshawar', district: 'Peshawar', phone: '091-9217480', emergency: true, specialties: ['Cardiology', 'Neurology', 'Oncology', 'Orthopedics', 'Burns Unit'], rating: 4.4, beds: 1300 },
    { name: 'Lady Reading Hospital (LRH)', type: 'public', description: 'Historic teaching hospital established 1927, 1600-bed major referral center.', location: 'Peshawar Cantonment', district: 'Peshawar', phone: '091-9211291', emergency: true, specialties: ['Surgery', 'Gynecology', 'Pediatrics', 'ENT', 'Ophthalmology'], rating: 4.3, beds: 1600 },
    { name: 'Northwest General Hospital', type: 'private', description: 'Premier private hospital in KPK - state-of-the-art diagnostics and ICU.', location: 'Phase 5, Hayatabad, Peshawar', district: 'Peshawar', phone: '091-5816800', emergency: true, specialties: ['Cardiology', 'Oncology', 'Transplant', 'IVF'], rating: 4.7, beds: 350 },
    { name: 'Rehman Medical Institute (RMI)', type: 'private', description: 'Modern 400-bed multi-specialty hospital with advanced diagnostic center.', location: 'Phase 5, Hayatabad, Peshawar', district: 'Peshawar', phone: '091-5895600', emergency: true, specialties: ['Cardiology', 'Neurology', 'Orthopedics', 'Gastroenterology'], rating: 4.6, beds: 400 },
    { name: 'Saidu Group of Teaching Hospitals', type: 'public', description: 'Main teaching hospital for Swat region, 450 beds.', location: 'Saidu Sharif, Swat', district: 'Swat', phone: '0946-720511', emergency: true, specialties: ['Surgery', 'Gynecology', 'Pediatrics', 'Orthopedics'], rating: 4.1, beds: 450 },
  ]);

  await EmergencyService.insertMany([
    { name: 'Rescue 1122 KPK', type: 'rescue', contact: '1122', district: 'Peshawar', available24h: true, description: 'Provincial emergency rescue - accident response, fire, flood, medical emergencies.' },
    { name: 'Police Emergency', type: 'police', contact: '15', altContact: '091-9211717', district: 'Peshawar', available24h: true, description: 'KPK Police emergency helpline for crime and security.' },
    { name: 'Edhi Ambulance', type: 'ambulance', contact: '115', district: 'Peshawar', available24h: true, description: 'Free ambulance service by Edhi Foundation across Pakistan.' },
    { name: 'Fire Brigade Peshawar', type: 'fire', contact: '16', altContact: '091-2527200', district: 'Peshawar', available24h: true, description: 'Peshawar City Fire Brigade - fire suppression and rescue.', location: 'Sunehri Masjid Road, Peshawar' },
    { name: 'PDMA KPK Disaster Helpline', type: 'disaster', contact: '1700', district: 'Peshawar', available24h: true, description: 'Provincial Disaster Management Authority - floods, earthquakes, landslides.' },
    { name: 'Chippa Welfare Ambulance', type: 'ambulance', contact: '1020', district: 'Peshawar', available24h: true, description: 'Free ambulance for accident victims and emergencies in KPK.' },
  ]);

  console.log('Seeded: Education, Hospitals, Emergency');

  await HomeNursingService.insertMany([
    { name: 'Shifa Home Care Services', serviceType: 'nursing', description: 'Professional registered nurses for post-operative and chronic illness care.', price: 3500, priceUnit: 'per_visit', rating: 4.6, phone: '0311-9180001', district: 'Peshawar', available24h: true },
    { name: 'HealthPlus Physiotherapy Home', serviceType: 'physiotherapy', description: 'Certified physiotherapists for stroke rehab and sports injuries.', price: 2500, priceUnit: 'per_visit', rating: 4.5, phone: '0333-9001122', district: 'Peshawar', available24h: false },
    { name: 'KPK Lab at Home', serviceType: 'lab', description: 'Home blood sample collection - CBC, HbA1c, lipid profile and 200+ tests.', price: 500, priceUnit: 'per_visit', rating: 4.7, phone: '0345-9112233', district: 'Peshawar', available24h: false },
    { name: 'Dr. House Call Service', serviceType: 'doctor_visit', description: 'MBBS doctors for home visits in Peshawar, Mardan and Nowshera.', price: 2000, priceUnit: 'per_visit', rating: 4.4, phone: '0321-9234567', district: 'Peshawar', available24h: true },
    { name: 'Naya Savera Elder Care', serviceType: 'elder_care', description: 'Full-time and part-time trained caregivers for elderly patients.', price: 35000, priceUnit: 'per_month', rating: 4.3, phone: '091-5892344', district: 'Peshawar', available24h: true },
  ]);

  await TransportRoute.insertMany([
    { from: 'Peshawar', to: 'Islamabad', operator: 'Daewoo Express', price: 750, duration: '2h 30m', vehicleType: 'bus', departures: ['6:00 AM','8:00 AM','10:00 AM','12:00 PM','2:00 PM','4:00 PM','6:00 PM','8:00 PM'], district: 'Peshawar', phone: '091-5700000', isActive: true },
    { from: 'Peshawar', to: 'Lahore', operator: 'Faisal Movers', price: 1800, duration: '5h', vehicleType: 'bus', departures: ['7:00 AM','9:00 AM','11:00 AM','2:00 PM','5:00 PM','8:00 PM'], district: 'Peshawar', phone: '091-5707070', isActive: true },
    { from: 'Peshawar', to: 'Karachi', operator: 'Skyways', price: 5500, duration: '20h', vehicleType: 'bus', departures: ['6:00 PM','8:00 PM','10:00 PM'], district: 'Peshawar', phone: '091-5713131', isActive: true },
    { from: 'Peshawar', to: 'Swat (Mingora)', operator: 'Kohistan Coaches', price: 500, duration: '3h', vehicleType: 'coaster', departures: ['7:00 AM','9:00 AM','11:00 AM','1:00 PM','3:00 PM'], district: 'Peshawar', phone: '091-2513344', isActive: true },
    { from: 'Peshawar', to: 'Mardan', operator: 'Flying Coach', price: 150, duration: '1h', vehicleType: 'van', departures: ['Every 30 mins 6am-9pm'], district: 'Peshawar', phone: '0300-5551234', isActive: true },
    { from: 'Peshawar', to: 'Chitral', operator: 'NATCO', price: 1200, duration: '7h', vehicleType: 'coaster', departures: ['6:00 AM','8:00 AM'], district: 'Peshawar', phone: '091-2524420', isActive: true },
    { from: 'Peshawar City', to: 'Hayatabad', operator: 'Peshawar BRT', price: 30, duration: '25m', vehicleType: 'bus', departures: ['Every 5 mins 6am-11pm'], district: 'Peshawar', phone: '091-5700001', isActive: true },
  ]);

  await CourierCompany.insertMany([
    { name: 'TCS Express', description: 'Pakistan largest courier, same-day delivery within Peshawar.', services: ['Same Day', 'Next Day', 'Economy', 'COD', 'International'], pricePerKg: 180, deliveryTime: 'Next Day nationwide', phone: '111-123-456', rating: 4.5, coverage: ['All Pakistan', 'International'], isActive: true },
    { name: 'Leopards Courier', description: 'Reliable overnight courier with strong KPK coverage.', services: ['Overnight', 'Economy', 'COD', 'Bulk Cargo'], pricePerKg: 160, deliveryTime: '1-2 Days', phone: '111-300-786', rating: 4.4, coverage: ['All Pakistan'], isActive: true },
    { name: 'M&P Courier', description: 'Tech-powered courier with real-time tracking and COD.', services: ['Express', 'Standard', 'COD', 'E-Commerce'], pricePerKg: 150, deliveryTime: '1-3 Days', phone: '111-345-786', rating: 4.3, coverage: ['All Pakistan'], isActive: true },
    { name: 'PostEx', description: 'E-commerce specialist courier with bulk pricing for online sellers.', services: ['COD', 'Return Management', 'E-Commerce Bulk'], pricePerKg: 130, deliveryTime: '2-4 Days', phone: '0311-1234567', rating: 4.2, coverage: ['All Pakistan'], isActive: true },
    { name: 'DHL Pakistan', description: 'International express courier - Peshawar pickup available.', services: ['International Express', 'Import', 'Export', 'Customs Clearance'], pricePerKg: 3500, deliveryTime: '2-5 Business Days international', phone: '111-345-345', rating: 4.6, coverage: ['220+ Countries'], isActive: true },
  ]);

  await LogisticsProvider.insertMany([
    { name: 'Pak Logistics KPK', description: 'Full-service freight and warehousing for businesses in KPK.', services: ['Road Freight', 'Warehousing', 'Distribution', 'Customs Clearance'], coverage: ['KPK', 'Punjab', 'Sindh'], phone: '091-5871234', rating: 4.3, priceRange: 'Negotiable per consignment', isActive: true },
    { name: 'Khyber Freight Services', description: 'Heavy cargo and container transport to Afghanistan and Central Asia.', services: ['Container Transport', 'Cross-Border', 'Heavy Equipment'], coverage: ['Pakistan', 'Afghanistan', 'Central Asia'], phone: '091-2567890', rating: 4.1, priceRange: 'Per container / per ton', isActive: true },
    { name: 'NTS Logistics', description: 'Cold chain and pharmaceutical logistics specialist for KPK.', services: ['Cold Chain', 'Pharma Distribution', 'Last Mile'], coverage: ['KPK', 'Nationwide'], phone: '0315-5001122', rating: 4.4, priceRange: 'PKR 25/kg + fixed charges', isActive: true },
  ]);

  console.log('Seeded: HomeNursing, Transport, Courier, Logistics');

  await RealEstateListing.insertMany([
    { title: '10 Marla House for Sale in Hayatabad Phase 6', type: 'house', purpose: 'sale', price: 35000000, area: 10, areaUnit: 'marla', bedrooms: 5, bathrooms: 4, location: 'Phase 6, Hayatabad, Peshawar', district: 'Peshawar', contact: '0300-9123456', features: ['Double Storey', 'Corner Plot', 'Garage', 'Servant Quarters', 'Solar Panels'], isActive: true },
    { title: '5 Marla Flat for Rent in University Town', type: 'apartment', purpose: 'rent', price: 55000, area: 5, areaUnit: 'marla', bedrooms: 3, bathrooms: 2, location: 'University Town, Peshawar', district: 'Peshawar', contact: '0333-8765432', features: ['Ground Floor', 'Gated Community', 'Backup Generator'], isActive: true },
    { title: '1 Kanal Plot for Sale on Ring Road', type: 'plot', purpose: 'sale', price: 28000000, area: 1, areaUnit: 'kanal', location: 'Ring Road, Peshawar', district: 'Peshawar', contact: '0321-7654321', features: ['Residential Zone', 'All Utilities Available', 'Near Motorway'], isActive: true },
    { title: 'Commercial Shop for Rent in Saddar', type: 'commercial', purpose: 'rent', price: 120000, area: 800, areaUnit: 'sqft', location: 'Saddar Road, Peshawar', district: 'Peshawar', contact: '091-2580011', features: ['Main Boulevard', 'High Footfall', 'Parking Available'], isActive: true },
    { title: '8 Marla House for Sale in Mardan', type: 'house', purpose: 'sale', price: 14500000, area: 8, areaUnit: 'marla', bedrooms: 4, bathrooms: 3, location: 'GT Road, Mardan', district: 'Mardan', contact: '0346-9001122', features: ['Double Storey', 'Garage', 'Boundary Wall'], isActive: true },
    { title: 'Farmhouse 2 Kanal near Swat Motorway', type: 'farmhouse', purpose: 'sale', price: 18000000, area: 2, areaUnit: 'kanal', bedrooms: 3, bathrooms: 2, location: 'Swat Motorway Exit 3, Mardan', district: 'Mardan', contact: '0312-5678901', features: ['Fruit Orchard', 'Tube Well', 'Mountain View'], isActive: true },
  ]);

  await GovtService.insertMany([
    { name: 'NADRA Regional Office Peshawar', department: 'NADRA', description: 'CNIC, passport and family registration services.', location: 'University Road, Peshawar', district: 'Peshawar', phone: '051-111-786-100', documents: ['Existing CNIC', 'Birth Certificate', 'Form B'], workingHours: 'Mon-Fri 8am-4pm, Sat 8am-1pm', category: 'Identity & Registration' },
    { name: 'Passport Office Peshawar', department: 'Interior Ministry', description: 'Passport issuance, renewal and emergency travel documents.', location: 'Saddar Road, Peshawar', district: 'Peshawar', phone: '091-9210344', documents: ['CNIC', 'Old Passport', '2 Photos', 'Fee Challan'], workingHours: 'Mon-Fri 8am-4pm', category: 'Travel & Passport' },
    { name: 'KPK Revenue Authority (KPRA)', department: 'KPRA', description: 'Provincial tax authority - sales tax on services, business registration.', location: 'Blue Area, Peshawar', district: 'Peshawar', phone: '0800-90909', workingHours: 'Mon-Fri 9am-5pm', category: 'Tax & Revenue' },
    { name: 'Motor Registration Authority (MRA)', department: 'Excise & Taxation', description: 'Vehicle registration, transfer, token tax payment.', location: 'Haji Camp, Peshawar', district: 'Peshawar', phone: '091-9213366', documents: ['CNIC', 'Purchase Invoice', 'Insurance', 'Fitness Certificate'], workingHours: 'Mon-Fri 8am-4pm', category: 'Vehicle & Transport' },
    { name: 'PESCO Customer Service', department: 'PESCO', description: 'New electricity connection, bill disputes, meter complaints.', location: 'Warsak Road, Peshawar', district: 'Peshawar', phone: '091-9213100', workingHours: 'Mon-Fri 8am-4pm', category: 'Utilities' },
    { name: 'KPK Baitulmal', department: 'Social Welfare Department', description: 'Financial assistance for orphans, widows and disabled persons.', location: 'Civil Secretariat, Peshawar', district: 'Peshawar', phone: '091-9210520', documents: ['CNIC', 'Poverty Certificate', 'Application Form'], workingHours: 'Mon-Fri 9am-4pm', category: 'Social Welfare' },
  ]);

  await WaterGasProvider.insertMany([
    { name: 'Sui Northern Gas Pipelines (SNGPL)', type: 'gas', description: 'Natural gas supply across KPK - new connections, complaints, billing.', coverage: ['Peshawar', 'Mardan', 'Nowshera', 'Charsadda', 'Swabi'], contact: '0800-00786', pricing: 'OGRA regulated - PKR 400-2000/month residential', district: 'Peshawar', isActive: true },
    { name: 'PESCO (Electricity)', type: 'electricity', description: 'Electricity supply for KPK - new connection, fault reporting.', coverage: ['Peshawar', 'Khyber', 'Mardan', 'Swat', 'Dir', 'Chitral'], contact: '118', pricing: 'NEPRA regulated - residential, commercial, industrial rates', district: 'Peshawar', isActive: true },
    { name: 'Water & Sanitation Services Peshawar (WSSP)', type: 'water', description: 'Piped water supply for Peshawar city - new connection, billing.', coverage: ['Peshawar City', 'Hayatabad', 'University Town', 'Cantt'], contact: '091-9213200', pricing: 'PKR 150-500/month based on connection size', district: 'Peshawar', isActive: true },
    { name: 'LPG Distributors KPK', type: 'gas', description: 'LPG cylinder and pipeline supply for areas without SNGPL.', coverage: ['Swat', 'Chitral', 'Dir', 'Kohistan', 'Buner'], contact: '0946-710011', pricing: 'PKR 4500-5000 per 11.8kg cylinder', district: 'Swat', isActive: true },
  ]);

  console.log('Seeded: RealEstate, Govt, WaterGas');

  await Hotel.insertMany([
    { name: 'Pearl Continental Peshawar', type: 'hotel', description: '5-star luxury hotel - 150 rooms, multiple restaurants and conference halls.', location: 'Khyber Road, Peshawar', district: 'Peshawar', rating: 4.7, reviews: 2100, pricePerNight: 22000, amenities: ['WiFi', 'Pool', 'Gym', 'Restaurant', 'Spa', 'Conference Hall', 'Valet Parking'], rooms: 150, isAvailable: true, phone: '091-2761111' },
    { name: 'Greens Hotel Peshawar', type: 'hotel', description: '4-star business hotel near Peshawar Cantonment.', location: 'Saddar Road, Peshawar Cantt', district: 'Peshawar', rating: 4.3, reviews: 890, pricePerNight: 8500, amenities: ['WiFi', 'Restaurant', 'Room Service', 'Parking', 'Conference Room'], rooms: 80, isAvailable: true, phone: '091-5274046' },
    { name: 'Hotel Swat Serena', type: 'resort', description: 'Luxury resort in Mingora - mountain views, gardens, traditional architecture.', location: 'Mingora, Swat', district: 'Swat', rating: 4.8, reviews: 1450, pricePerNight: 16000, amenities: ['WiFi', 'Restaurant', 'Garden', 'Mountain View', 'Parking'], rooms: 60, isAvailable: true, phone: '0946-711701' },
    { name: 'Frontier Hotel Chitral', type: 'hotel', description: 'Popular mid-range hotel in Chitral, base camp for trekkers.', location: 'Shahi Bazaar, Chitral', district: 'Chitral', rating: 4.2, reviews: 620, pricePerNight: 4500, amenities: ['WiFi', 'Restaurant', 'Hot Water', 'Parking', 'Trekking Guide'], rooms: 35, isAvailable: true, phone: '0943-412233' },
    { name: 'Rock City Hotel Kalam', type: 'guesthouse', description: 'Charming guesthouse in Kalam - wooden cabins, river view, home-cooked food.', location: 'Kalam Village, Swat', district: 'Swat', rating: 4.6, reviews: 980, pricePerNight: 5500, amenities: ['River View', 'Home Cooked Meals', 'Bonfire', 'Hiking Trails'], rooms: 20, isAvailable: true, phone: '0342-9112233' },
  ]);

  await Job.insertMany([
    { title: 'Software Engineer (Flutter)', company: 'NTSolutions Peshawar', description: 'Build and maintain Flutter mobile apps. 2+ years Flutter experience required.', category: 'IT & Technology', type: 'full-time', location: 'Hayatabad, Peshawar', district: 'Peshawar', salary: { min: 80000, max: 150000, currency: 'PKR' }, skills: ['Flutter', 'Dart', 'GetX', 'REST APIs', 'Git'], deadline: new Date('2026-06-30'), isActive: true },
    { title: 'Medical Officer (MBBS)', company: 'Northwest General Hospital', description: 'MO position in Emergency Department. PMDC registered.', category: 'Healthcare', type: 'full-time', location: 'Hayatabad, Peshawar', district: 'Peshawar', salary: { min: 120000, max: 180000, currency: 'PKR' }, skills: ['MBBS', 'PMDC Registration', 'Emergency Medicine'], deadline: new Date('2026-06-15'), isActive: true },
    { title: 'Deputy Manager Finance', company: 'Ghulam Ishaq Khan Institute', description: 'CA/ACCA qualified finance professional for a leading KPK university.', category: 'Finance & Accounting', type: 'full-time', location: 'Topi, Swabi', district: 'Swabi', salary: { min: 150000, max: 220000, currency: 'PKR' }, skills: ['CA / ACCA', 'SAP', 'Financial Reporting', 'Budgeting'], deadline: new Date('2026-05-31'), isActive: true },
    { title: 'School Teacher (English)', company: 'Army Public School Peshawar', description: 'B.Ed / M.A English with 2 years teaching experience.', category: 'Education', type: 'full-time', location: 'Warsak Road, Peshawar', district: 'Peshawar', salary: { min: 55000, max: 75000, currency: 'PKR' }, skills: ['M.A English', 'B.Ed', 'Classroom Management'], deadline: new Date('2026-06-10'), isActive: true },
    { title: 'Civil Engineer (Site)', company: 'FWO Projects KPK', description: 'B.E Civil for road/bridge construction in KPK. 3 years site experience.', category: 'Engineering', type: 'contract', location: 'KPK Field', district: 'Peshawar', salary: { min: 100000, max: 160000, currency: 'PKR' }, skills: ['B.E Civil', 'AutoCAD', 'Site Supervision', 'PEC Registration'], deadline: new Date('2026-07-01'), isActive: true },
  ]);

  await Business.insertMany([
    { name: 'Sarhad Chamber of Commerce', category: 'Commerce & Trade', description: 'Premier business association representing 50,000+ businesses in KPK.', address: 'Sarhad Chamber House, GT Road', city: 'Peshawar', district: 'Peshawar', phone: '091-2560485', rating: 4.3, reviews: 520, isVerified: true, isActive: true },
    { name: 'Peshawar Dry Fruit Market', category: 'Wholesale & Retail', description: 'Largest wholesale dry fruit market in Pakistan - almonds, walnuts, pistachios.', address: 'Qissa Khwani Bazaar', city: 'Peshawar', district: 'Peshawar', phone: '091-2521144', rating: 4.7, reviews: 3100, isVerified: true, isActive: true },
    { name: 'Karkhano International Market', category: 'Shopping', description: 'Famous duty-free market near the Afghan border - electronics, fabrics, dry fruits.', address: 'Karkhano Bazaar, Hayatabad', city: 'Peshawar', district: 'Peshawar', phone: '091-5811001', rating: 4.5, reviews: 4200, isVerified: true, isActive: true },
    { name: 'KPEZDMC Industrial Estates', category: 'Industrial', description: 'Developer of special economic zones and industrial estates in KPK.', address: 'Civil Secretariat', city: 'Peshawar', district: 'Peshawar', phone: '091-9210340', rating: 4.1, reviews: 180, isVerified: true, isActive: true },
  ]);

  await Event.insertMany([
    { title: 'Peshawar Literature Festival 2026', category: 'Cultural', description: 'Annual literature festival celebrating Pashto, Urdu and English literature.', location: 'Nishtar Hall, Peshawar', district: 'Peshawar', startDate: new Date('2026-06-15'), endDate: new Date('2026-06-17'), isActive: true },
    { title: 'Swat Fruit Festival', category: 'Food', description: 'Celebrate the cherry, peach and apple harvest in Swat.', location: 'Mingora Sports Ground, Swat', district: 'Swat', startDate: new Date('2026-07-10'), endDate: new Date('2026-07-12'), isActive: true },
    { title: 'KPK Startup Summit 2026', category: 'Business', description: 'KPK premier startup pitch competition and tech conference.', location: 'Pearl Continental Peshawar', district: 'Peshawar', startDate: new Date('2026-06-25'), endDate: new Date('2026-06-26'), isActive: true },
    { title: 'Chitral Cultural Festival', category: 'Cultural', description: 'Kalash traditions, polo matches, handicrafts and traditional music.', location: 'Chitral Polo Ground', district: 'Chitral', startDate: new Date('2026-08-01'), endDate: new Date('2026-08-03'), isActive: true },
  ]);

  console.log('Seeded: Hotels, Jobs, Businesses, Events');
  console.log('\nDatabase seeded successfully!');
  await mongoose.disconnect();
}

seed().catch(err => { console.error(err); process.exit(1); });

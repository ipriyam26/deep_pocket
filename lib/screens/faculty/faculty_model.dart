// ignore_for_file: non_constant_identifier_names, camel_case_types



class Faculty_model {
  Faculty_model({
    required this.Name,
    required this.Image,
    required this.Designation,
    required this.School,
    required this.Department,
    required this.Position,
    required this.Email,
    required this.About,
    required this.Education,
    required this.Experience,
    required this.Research,
    required this.Projects,
    required this.Distinction,
    required this.profile,
  });

  final String Name;
  final String Image;
  final String Designation;
  final String School;
  final String Department;
  final String Position;
  final String Email;
  final String About;
  final List<String> Education;
  final List<String> Experience;
  final List<String> Research;
  final List<String> Projects;
  final List<String> Distinction;
  final String profile;
}

class Faculty_mock {
  List<Faculty_model> get mockF {
    return [..._faculty];
  }

  final List<Faculty_model> _faculty = [
    Faculty_model(
        Name: "Dr. Debajyoti Mukhopadhyay",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/06/Dr.Debajyoti-Mukhopadhyay310.jpg",
        Designation: "Dean, School of Engineering & Applied Sciences",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "debajyoti.m@bennett.edu.in",
        About: "",
        Education: [
          " Ph.D. (1994)",
          "Jadavpur University, Calcutta, India; Distributed Computing ",
          " M.S. (1982) ",
          " Stevens Institute of Technology, New Jersey, USA; Computer Science ",
          " D.C.S. (1979) ",
          "Queens University of Belfast, Northern Ireland, UK; Computer Science ",
          "B.E. (1977) ",
          " Indian Institute of Engineering Science &amp; Technology, Shibpur, India, Electronics &amp; Telecomm "
        ],
        Experience: [
          " Dean and Professor of Computer Engineering - Bennett University School of Engineering & Applied Sciences, June ",
          " Director & Dean(R&D) and Professor of Computer Engineering  Mumbai University  NHITM ",
          "Dean and Distinguished Professor  Adamas University School of Engineering and School of Professional Studies ",
          "Dean(R&D) and Professor & Head of Information Technology  Maharashtra Institute of Technology ",
          "Professor and Founding Head of MIS & IT  Calcutta Business School ",
          "Professor and Head of Computer Science & Engineering  West Bengal University of Technology affiliated Engineering Colleges ",
          "President & CEO - Data-Core (India) Limited ",
          "Director  SriSoft Corporation, Los Angeles, USA ",
          "Senior Consultant  Tata Consultancy Services ",
          "Scientist  Computing Systems & Architecture Lab  Bell Communications Research, New Jersey, USA "
        ],
        Research: [
          " Data Engineering",
          "Internet of Things",
          "Middleware functions of Distributed Computing",
          "Web Data Mining",
          "E-Negotiation Protocols"
        ],
        Projects: [
          "Book Recommendation System - Pune University;",
          "Milk Distribution System using IoT Technology  Pune University",
          "Development of OSCA Architecture for Bell Telephone Companies to support Interoperability among Heterogeneous System  Regional Bell Telephone Companies USA",
          "Design and development of CENTREX Office Features  South Western Bell and Ameritech USA",
          "Generic Information Retrieval System  Bell Atlantic USA",
          "LU6.2 Protocol based System to Support Interoperability in Regional Bell Companies  Pacific Bell USA",
          "Support of Semantic Integrity in Multi Database Systems  Regional Bell Telephone Companies USA"
        ],
        Distinction: [
          "Dr. Mukhopadhyay has been invited to deliver seminar across the globe in well know places, like: University of California Berkeley, UC Davis, UCLA, Purdue University, University of Miami, Stevens Institute of Technology, IIT Kharagpur, IIEST Shibpur, ISI Calcutta, Jadavpur University, Delhi Technological University, Chonbuk National University South Korea, Bell Atlantic, Pacific Bell, NYNEX, Bell South, South Western Bell, Swedish Telephone Company Telia AB. He had held visiting positions at Monarch Business School Switzerland, Thapar University, IIEST Shibpur, Chonbuk National University South Korea, George Mason University USA, Curtin University Australia. ",
          " He has received the following awards: CSI Distinguished Speaker; Best Teacher in Information Technology by Star and Dainik Bhaskar; Cognizant Technology Best Faculty Award; Ideal Teacher Award by MIT Pune; Peer Award by Bell Communications Research USA; Graduate Fellowship by Stevens Institute of Technology USA; G.P. Ghosh Scholarship by University of Calcutta; Research Fellowship by Indian Statistical Institute Calcutta; National Merit Scholarship by Government of India. ",
          " He was elected a Fellow of IE(India); IETE(India); Senior Member of IEEE(USA); Senior Member of ACM(USA); Inducted in the Whos Who in the World "
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-debajyoti-mukhopadhyay/"),
    Faculty_model(
        Name: "Prof. Sunil Saxena",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/Mr.-Sunil-Saxena-Professor-and-HOD.jpg",
        Designation: "HOD, Times School of Media",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Sunil.saxena@bennett.edu.in",
        About:
            "Sunil Saxena is an award-winning media professional with almost four decades of experience in Print Journalism, New Media, Social Media, Mobile Journalism, Media Education and Research. As a media educator, he has set up three media schools  the Asian College of Journalism, the International Media Institute of India and the School of Communication of the G.D. Goenka University. Besides this, he has had two stints with The Times School of Journalism. He has authored three media books. Before getting into academics, he spent 27 years working as a journalist. The organisations where he has worked include The Times of India, India Today, The New Indian Express, The Pioneer and the Business India Group. He incubated the award-winning Gaon Ki Awaaz, Indias first voice-based news and information service for rural India that won two South Asian awards and the National award for innovation. He writes a blog  www.easymedia.in -- to share his media knowledge.",
        Education: [
          "1978",
          "MA Lucknow University",
          "November December 1985",
          "Qualification Course in Press Journalism International Institute of Journalism, Georgi Dimitrov, Bulgaria"
        ],
        Experience: [
          "Professor and HoD, Times School of Media, Bennett",
          "Founder Dean, School of Communication G.D.Goenka University, Gurgaon ",
          "Director, Amity School of Communication Amity University Rajasthan",
          "Founder Dean International Media Institute of India, Noida",
          "Senior Vice President Indo-Asian News Service, New Delhi",
          "Vice President Express Network Private Limited, Chennai",
          "Associate Editor, The New Indian Express, Chennai",
          "Founder Dean Asian College of Journalism,Bangalore",
          "Deputy Resident Editor The Pioneer, Lucknow",
          "Assistant Professor Times School of Journalism, New Delhi",
          "Assistant Editor India Week, New Delhi",
          "Assistant Professor Times School of Journalism, New Delhi",
          "Senior Sub-editor India Today, New Delhi",
          "Senior Sub-editor The Times of India, Lucknow",
          "Staff Reporter Northern India Patrika, Lucknow",
          "Sub-editor The Pioneer, Lucknow"
        ],
        Research: ["Social Media", "Mobile Journalism"],
        Projects: [],
        Distinction: [
          "NASSCOM Social Innovation Honours 2011",
          "Manthan Award for South Asia 2010",
          "mBillionth Award for South Asia 2010"
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-sunil-saxena/"),
    Faculty_model(
        Name: "Dr. Vinod Shastri",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/03/vinod.shastri310x310.jpg",
        Designation: "Head Academics & Research",
        School: "Centre for Innovation and Entrepreneurship",
        Department: "null",
        Position: "null",
        Email: "vinod.shastri@bennett.edu.in",
        About:
            "Dr. Vinod Shastri brings with him three decades of entrepreneurship development experience across multiple organisations; including MCED, NIMID, NEN and SIBM.",
        Education: [
          "Ph. D. (2015)",
          "Symbiosis International University ",
          "NET (1996)",
          " University Grants Commission",
          "M. Com. (1987)",
          " University of Poona, Ganeshkhind, Pune",
          "MBA (1985)",
          " University of Poona, Ganeshkhind, Pune",
          "B. Com. (1982)",
          " University of Poona, Ganeshkhind, Pune"
        ],
        Experience: [
          "Head Academics (CIE), Bennett University ",
          "Trainer-Motivator, Maharashtra Centre for Entrepreneurship Development (MCED)",
          "Manager (Administration), Shilpa Paints Industries ",
          "Trainer-Motivator, National Institute of Motivational & Institutional Development (NIMID)",
          "Executive Officer, Institute of Company Secretaries of India (ICSI)",
          "Consultant, Evangelist & Master Educator, National Entrepreneurship Network (NEN)",
          "Lecturer in Commerce, St. Vincent College of Commerce ",
          "Lecturer in Commerce, H. V. Desai College of Commerce",
          "Lecturer in Management, Institute of Management & Career Development (IMCD) ",
          "Lecturer in Management, Centre for Management Research & Development (CMRD) ",
          "Reader in Management (Assistant Professor), Centre for Management Research & Development (CMRD) ",
          "Assistant Professor, Symbiosis Institute of Business Management (SIBM)"
        ],
        Research: ["1.Entrepreneurship", "2. Corporate Entrepreneurship"],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-vinod-shastri/"),
    Faculty_model(
        Name: "Dr. Rama Komaragiri",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/ramaGiri310x310.jpg",
        Designation:
            "Dean, Academic Affairs Department of Electronics and Communications Engineering",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "Members (Academic Council)",
        Email: "rama.komaragiri@bennett.edu.in",
        About:
            "Dr. Rama Subrahmanyam Komaragiri is Ph.D. from Technical University of Darmstadt, Germany (2005), M.Tech in Solid State Technology from IIT Madras (2002) and M.Sc in Physics from IIT Bombay(2000). His areas of interest include Nanoelectronics, Novel Semiconductor Devices, VLSI, Power Semiconductor Devices, MEMS, NEMS, Molecular Electronics, Modeling and Simulation of Semiconductor Devices, Engineering Education aspects. ",
        Education: [
          "PhD (2006)",
          "TU Darmstadt, Germany - Electronics Engineering",
          "M.Tech (2002)",
          "Indian Institute of Technology (IIT) Madras - Solid State Technology",
          "M.Sc. (2000)",
          "Indian Institute of Technology (IIT) Bombay Physics"
        ],
        Experience: [
          "Professor and HoD - Bennett University Department of ECE",
          "Associate Professor - National Institute of Technology Calicut",
          "Assistant Professor - National Institute of Technology Calicut",
          "System Expert Qimonda Technologies GmbH,Dresden, Germany"
        ],
        Research: [
          "Semiconductor Device Modeling and Circuit Design",
          "Semiconductor device fabrication",
          "MEMS and NEMS sensors"
        ],
        Projects: [
          "\"Fabrication and Modeling of Planar Non-spiral coils for MEMS Magnetic Sensors\", Under INUP programme",
          "Analog Circuit Design and Simulation with RFET (Reconfigurable Field Effect Transistor)",
          "Signal Processing algorithms for ECG detection suitable to VLSI implementation"
        ],
        Distinction: [
          "2006 - Team of the Month award at Qimonda Dresden GMBH",
          "2002 Deutsche Forschungs Geminschaft scholarship, at TU DarmstDarmstadt, ",
          "2001Germany2001 - DAAD Scholarship to continue M.Tech Thesis at TU Darmstadt Germany"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rama-komaragiri/"),
    Faculty_model(
        Name: "Om Prakash Dwivedi",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/01/om-dwivedi310x310.png",
        Designation: "HOD, School of Liberal Arts",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "om.dwivedi@bennett.edu.in",
        About:
            "Om Prakash Dwivedi is an Associate Professor of English in the School of Management (Liberal Arts Dept). His areas of interest lie in the field of Indian Writing in English, Postcolonial theory, and Literature and Cultural Studies. He sits on the Advisory board of the internationally renowned journal, Journal of Postcolonial Writing (Routledge, UK). He is also the Vice-Chair of the international research network, Challenging Precarity: A Global Network. His major publications include ReOrientalism and Indian Writing in English (Palgrave, UK); Human Rights and the Postcolonial India (Routledge: India & UK); Indian Writing in English and the Global Literary Market (Palgrave: UK).",
        Education: [
          "D.Phil (2008)",
          "University of Allahabad",
          "MA (2005)",
          "University of Allahabad",
          "BA (2003)",
          "University of Allahabad"
        ],
        Experience: [],
        Research: [
          "Postcolonial theory and literature",
          "Indian Writing in English",
          "Cultural Studies"
        ],
        Projects: [
          "Challenging Precarity (University of Northampton, UK & University of Rome tor Vergata, Italy)",
          "The World To Come (Deakin University, Australia)"
        ],
        Distinction: [
          "Visiting Scholar,  University of Rome tor Vergata (Jan. 2020)",
          "Received Funding from the Sahitya Akademi to organise a National Seminar on Critical Traditions in India, 17-18 March, 2019. (AURO University, Surat, Gujarat)",
          "Advisory Board, Journal of Postcolonial Writing (Routledge : London)",
          "Scientific Committee member, Margins (Book series, Milan : Italy)",
          "Scientific Board member, Romanian Journal of Indian Studies (CLUJ University, Romania)"
        ],
        profile: "https://www.bennett.edu.in/faculties/om-prakash-dwivedi/"),
    Faculty_model(
        Name: "Dr. Rajinder Singh Chauhan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/36_Dr.-Rajinder-Singh-Chauhan-HOD-_-Professor.jpg",
        Designation: "Dean, Research & Consultancy Department of Biotechnology",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "rajinder.chauhan@bennett.edu.in",
        About: "null",
        Education: [
          "DBT Overseas Associateship in Genomics (1997-2004)",
          "University of Wisconsin, Madison, USA",
          "Ph.D. Agriculture Biotechnology (1991)",
          "HP Agriculture University, Palampur",
          "MSc Mycology & Plant Pathology (1988)",
          "HP Agriculture University, Palampur "
        ],
        Experience: [
          "Dean (Research & Consultancy), Bennett University",
          "Professor & Head, Department of Biotechnology, Bennett University ",
          "Dean (Biotechnology), Jaypee University of Information Technology, Solan, HP",
          "Professor & Head, Department of Biotechnology & Bioinformatics, Jaypee University of Information Technology, Solan, HP",
          "Associate Professor, Biotech Centre, HP Agriculture University, Palampur, H.P.",
          "Visiting Scientist, University of Wisconsin, Madison, USA",
          "Assistant Professor, Biotech Centre, HP Agriculture University, Palampur, H.P."
        ],
        Research: [
          "1. Genomics-assisted biosynthetic pathway discovery in medicinal herbs",
          "2. Metabolic engineering for production of industrial phytochemicals"
        ],
        Projects: [],
        Distinction: [
          "1. Awarded research grants worth Rs. 17 crores from different funding agencies such as DBT, DST, DRDO, MoH, MoEF, etc. of the Govt. of India",
          "2. Provided leadership as a Professor & Head to rank Biotechnology programme at #1 consecutively for 3 yrs among all private institutions in India",
          "1. Awarded Overseas Long Term Associateship of the Department of Biotechnology (DBT), Ministry of Science & Technology, Govt. of India for the year 1997 at University of Wisconsin, Madison, USA. ",
          "2. Awarded BOYSCAST Fellowship of the Department of Science & Technology (DST), Ministry of Science & Technology, Govt. of India for the year 1998. ",
          "1. Jawahar Lal Nehru Academic Award for Outstanding Post Graduate Research in Agriculture and Allied Sciences (Agriculture Biotechnology) for the year 1992 of the Indian Council of Agricultural Research, New Delhi, INDIA",
          "2. Pran Vohra Award in Agricultural Sciences (Plant Biotechnology) of the Indian Science Congress Association for the year 1995-96.",
          "3. Member, Executive Board Review of different Five Year Plan Programmes of the DRDO, Govt. of India life sciences labs, including Defence Institute of High Altitude Research, Leh (Since August 2009- till date)",
          "4. Nominated Expert Committee Member (2016-2019) for approval and review of Core Support proposals/ projects having a budget of over One Crore under SEED Division of the Department of Science & Technology (DST), Ministry of Science & Technology, Govt. of India",
          "5. Member, Nomination Council, Annual Infosys Prizes of the Infosys Science Foundation w.e.f. 2013 till date",
          "6. Nominated Member, National Academy of Sciences (NASI), India in 2017",
          "1. Patents Granted: 6; Patents Filed/Published: 3",
          "2. Guided 17 Ph.D. Theses; Research Publications: 106; Conference Papers: 70;",
          "3. Best research paper awards in national and international conferences"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-rajinder-singh-chauhan/"),
    Faculty_model(
        Name: "Dr. Deepak Garg",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/04/Deepak-Garg.jpg",
        Designation:
            "Dean, International relations & Corporate Outreach; HOD, Computer Science & Engineering",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "Members (Academic Council)",
        Email: "deepak.garg@bennett.edu.in",
        About:
            "Dr. Deepak Garg is a committed Academician with over 18 years of experience at leading academic institution. He has an experience in automating and implementing the technology solution on a larger scale in education sector. He also has an extensive experience in designing curriculum, developing education pedagogy and managing industry-institute interaction. ",
        Education: ["PhD (2006)", "Thapar University, Patiala "],
        Experience: [
          "Professor and Head-Computer Science and Engineering Department, School of Engineering & Applied Sciences, Bennett University ",
          "Professor and Head Computer Science and Engineering, Thapar University, Patiala",
          "Software Engineer IBM Global Services"
        ],
        Research: [
          "Data Science, Data Analytics, Deep Learning",
          "Advance data structures and algorithms, Approximation algorithms, Optimization",
          "MOOCs, Transformations in Higher Education with quality perspective"
        ],
        Projects: [
          "Pattern Discovery using DNA sequences, AICTE, RPS, (2004-2009)",
          "Tox2020: Toxicity Prediction of pre clinical trial drug using Physicochemical Properties and Machine Learning Approaches, DST, (2016-2018)",
          "Innovative research in pedagogy for Mini-MOOCs blended with instruction strategies to enhance quality of Higher Education, Royal Academy of Engineering, UK and FICCI (2016-2018)"
        ],
        Distinction: [
          "Jan 2012- Dec 2016- Chair,IEEE Education Society Chapter, India Council",
          "Jan 2012 -Dec 2016- Chair,IEEE Computer Society Chapter, India Council",
          "2009-2018- Steering Committee Chair, Annual IEEE International Conference on Advance Computing",
          "2013-2018- Steering Committee Chair-Annual IEEE International Conference on MOOCs,Innovation and Technology in Education",
          "ABET PEV and ABET IDEAL Scholar, NBA Evaluator",
          " Chair, IEEE International Conference on Machine Learning & Data Science, 2017",
          " Chair, IUCEE International Conference on Transformations in Engineering Education, 2018",
          "Chair, ACM SIGACT North India, (2013-17)"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-deepak-garg/"),
    Faculty_model(
        Name: "Dr. Nuzhat Parveen Khan",
        Image: "https://www.bennett.edu.in/wp-content/uploads/2017/05/s2.png",
        Designation: "Dean, School of Law",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "nuzhat.khan@bennett.edu.in",
        About:
            "Dr. Nuzhat Parveen Khan is currently working as the Professor and Dean, School of Law. She has twenty eight years of academic experience in a Central University i.e. Jamia Millia Islamia, New Delhi.  She has authored dozens of books on conflicting and contemporary legal issues. To name the few, Women and Child Related Laws (LexisNexis India), Women and the Law, Child and the Law (Lexis Nexis India), Comparative Constitutional Law (Satyam Law International), Legal Control of Air Pollution: Problems and Perspectives (Metropolitan Book Company Pvt. Ltd.), Socio-Economic Offence (Central Law Publications) etc. Prof. Khan has contributed and presented modules on Jurimetrics for the UGC e-Pathshala Project at graduate and post graduate level. She has also authored study materials for various universities and colleges across the nation.Her Ph.D. on the topic Air Pollution: Problem of Its Legal Control with Special Reference to NCT of Delhi, was awarded publication grant by the Indian Council for Social Sciences Research, Ministry of HRD.  It was published as a book accordingly. Prof. Khan has published more than 50 research papers in prestigious refereed and peer reviewed journals covering diverse areas of laws. She is also member of Governing Bodies, Academic Councils and Executive Councils of various leading universities of India.Prof. Khan has held various academic and administrative posts viz. Dean, Faculty of Law, Jamia Millia Islamia, New Delhi, (2016-201); Chairperson (Law), National Council for Promotion of Urdu Language, MHRD; Chairperson, Internal Complaints Committee, Jamia Millia Islamia, New Delhi, Provost, Hall of Girls Residence, Jamia Millia Islamia, New Delhi to name the few.",
        Education: [
          " Ph.D.(2004), Environmental Law [Air Pollution: Problem of Its Legal Control with Special Reference to NCT of Delhi.] ",
          " Jamia Millia Islamia, New Delhi",
          " NET (1994), Law ",
          " UGC",
          "LL.M. (1988), Law [Child Right & Abuse: An Empirical Study of Lock Industry in Aligarh] ",
          " Aligarh Muslim University, Aligarh, U.P.",
          "LL.B. (Hons.) (1986) ",
          "Aligarh Muslim University, Aligarh, U.P.",
          "B.Sc. (Hons.) (1983) ",
          "Aligarh Muslim University, Aligarh, U.P.",
          " NET (1994), Law ",
          " UGC"
        ],
        Experience: [
          " Professor & Dean, Bennett University",
          "  Dean, Faculty of Law, Jamia Millia Islamia, New Delhi",
          " Professor, Faculty of Law, Jamia Millia Islamia, New Delhi",
          " Associate Professor, Faculty of Law, Jamia Millia Islamia, New Delhi",
          "Assistant Professor, Faculty of Law, Jamia Millia Islamia, New Delhi "
        ],
        Research: [
          "Gender Justice- Women & Child Rights ",
          "Environmental Law ",
          "Labour Laws ",
          "Constitutional Law "
        ],
        Projects: [
          "National Commission for Women Project in collaboration with Jamia Millia Islamia, New Delhi on Women Related Laws to Impart Legal Awareness among Women. [The Legal Awareness Programmes was organized to impart Legal Awareness Programme about Women Related Laws]. [10 October to 6 December, 2015]",
          "National Commission for Women Project in collaboration with Jamia Millia Islamia, New Delhi on Standardized Module for Legal Awareness Programme about Women Related Laws. [The module was prepared with the aim to empower women and girls with the knowledge of laws related to women, legal rights and duties, to enable them, to share power equally, gain full access to the means of development, and to inspire a whole generation of women to work together towards achieving equality and justice.] [April-June 2014].",
          "National Commission for Women, New Delhi [Ministry of Women and Child Welfare, Govt. of India] Research Project on A Study of Discriminative and Derogatory Practices against Women by Khap Panchayats, Kangaroo Courts and Shalishi Adalats in India: An Empirical Study in the States of Haryana, Rajasthan, Western U.P. and West Bengal [June 2014].",
          "[Report available at: http://ncw.nic.in/pdfReports/ReportbyJamiaMilia.pdf.]"
        ],
        Distinction: [
          "  Awarded publication grant by Indian Council for Social Sciences Research (ICSSR) Ministry of HRD for publication of Ph.D. thesis, as a book entitled Legal Control of Air Pollution, Problems and Perspectives. ",
          "  Received Women Achievers of AMU Award in Sir Syed Bicentenary AMU Alumni Meet 2017-18 at Aligarh Muslim University, Aligarh. ",
          "  Prof. Khan initiated and introduced three new inter-disciplinary programmes and career-oriented courses namely the LL.M. (Executive) Programme, Post Graduate Diploma in Labour Laws & Air and Space Laws. ",
          "  Prof. Khan is the key figure behind generating funds for the institution with the introduction of Self-Finance Undergraduate Program, Postgraduate Programs and two PG Diploma Programs in the span of two year of her deanship. ",
          "  Prof. Khan has delivered lectures extensively as resource person/keynote speaker in various National and International Seminars, Conferences and Faculty Development Programs. She was invited as Keynote Speaker at the 7th Academic International Conference on Interdisciplinary Legal Studies (AICILS 2017 Boston) at Harvard University, USA in 2017. She even presented a paper entitled Recognition of Food Right in the Food Security Laws in India at the event. She has been frequently invited as a resource person on Lok Sabha TV, Zee T.V. and Doordarshan Channels on Gender Discourses and Legal Point shows. She is also a resource person to various bodies like UPSC and State Public Service Commissions and advisor to various universities and institutions. "
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-nuzhat-parveen-khan/"),
    Faculty_model(
        Name: "Dr Nilanjan Chattopadhyay",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/01/Nilanjan-Chattopadhyay310x310.png",
        Designation: "Dean, School of Management",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "n.chattopadhyay@bennett.edu.in",
        About:
            "In over two decades in business schools, Dr Chattopadhyay has not only been a sought-after teacher, but has also led building of management institutions of repute. Apart from teaching and research, he led corporate interaction, alumni relationship, executive education and student admissions at top Business Schools in India. In his academic career so far, he has worked with some of the best business schools in India, including S P Jain Institute of Management Mumbai, IMT Ghaziabad, Indian Institute of Foreign Trade, New Delhi and Manipal University in Dubai and Jaipur. Immediately before joining Bennett University, Dr Nilanjan was with Presidency University as Dean, School of Management. He designed and delivered several long term and intensive corporate training programs in Dubai, Abu Dhabi and India for large corporations like Genpact, NIIT, ONGC, Power Grid Corporation, Abu Dhabi Commercial Bank, Costa Coffee, Daman Insurance. His consulting client list includes MakemyTrip, Cleartrip, Flipkart, Yebhi, Indiamart",
        Education: [
          " Ph.D. (2011)",
          "Management, University of Rajasthan ",
          "PGDBA (1998)",
          "Finance and Information Systems, ICFAI Business School ",
          "Advanced Diploma in Finance (1998)",
          " FinanceICFAI ",
          "ICWA (1997)",
          " Management Accounting, ICWAI ",
          " B.Sc (Honours) 1990",
          " Physics, University of Calcutta  "
        ],
        Experience: [
          " Dean School of Management, Bennett University",
          "Dean, School of Management, Presidency University Bengaluru",
          "Dean, Faculty of Management and Commerce, Manipal University Jaipur, TAPMI School of Business",
          "Professor and Dean, School of Business and Dean, Corporate Executive Education, Manipal University Dubai",
          "Head New Initiatives, IMT Ghaziabad",
          "Associate Professor, SP Jain Institute of Management and Research Mumbai",
          "Associate Professor, IMT Ghaziabad"
        ],
        Research: ["1.Service Management", "2.Innovation", "3.E-commerce"],
        Projects: [],
        Distinction: [
          " Visiting Professor at University of South Pacific at Cook Islands, Thammasat Business School in Thailand and University of Haifa in Israel, ",
          "Awarded with Honourable Mention Certificate at ISB Ivey Global Case Competition 2017",
          "Awarded with Second prize in First Case Study Competition for teachers in Business Schools in India, organized by Case Research Society of India, 2009",
          "Awarded with Certificate of Merit, Institute of Cost and Works Accountants of India, 1997",
          "Awarded with National Merit Scholarship from Government of India "
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-nilanjan-chattopadhyay/"),
    Faculty_model(
        Name: "Dr. Anu Thakur",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/11/Dr-Anu-Thakur310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "anu.thakur@bennett.edu.in",
        About:
            "Dr. Anu Thakur is an Assistant Professor (Finance) at School of Management, Bennett University. She holds a Ph.D. from University School of Financial Studies, Guru Nanak Dev University, Amritsar (Punjab) in Strategic Management. She has also qualified UGC-NET/JRF in the year 2011. She has more than 8 years of rich experience in research and academics. Her research work has been published in reputed international journals. Dr. Thakur has presented her research work at various conferences held at IIM Ahmedabad, IIM Indore, IIT Roorkee, MDI Gurgaon and many more. Dr. Thakurs research interests include competitive strategies, diversification, emerging markets, and institutional voids. ",
        Education: [
          " Ph.D. (2017), Strategic Management ",
          " University School of Financial Studies, Guru Nanak Dev University, Amritsar (Punjab) ",
          " M.Com (2011)",
          " Guru Nanak Dev University ",
          " B.com (Professional) (2009) ",
          "Guru Nanak Dev University "
        ],
        Experience: [
          " Assistant Professor at Bennett University",
          " Assistant Professor/Area Chairperson, GL Bajaj Institutes of Research and Management ",
          " Assistant Professor, Lovely Professional University ",
          " Assistant Professor, Guru Nanak Dev University ",
          " Senior Researcher, Guru Nanak Dev University"
        ],
        Research: [
          "Competitive Strategies ",
          "Diversification  ",
          "Emerging Markets ",
          "Institutional Voids "
        ],
        Projects: [],
        Distinction: [
          " Awarded UGC-NET/JRF scholarship for Ph.D for the period 2011-2016. ",
          " Nominated for the Best Paper Award, Fourth Pan-IIM World Management Conference, IIM Ahmedabad, 2016.",
          " Scholarship Award granted by Punjab State Government"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-anu-thakur/"),
    Faculty_model(
        Name: "Dr. Priyanka Chatterjee",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Dr-Priyanka-Chatterjeeb.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "I am presently working as Assistant Professor of Economics in the School of law of Bennett University.  Earlier, I served as Assistant Professor of Economics in the School of Business Studies, Sharda University, Greater Noida and as Assistant Professor, School of Management, Presidency University, Bengaluru. Before that I was working as the Senior Programme Coordinator and Data Analyst in Public Health Resource Society (Network). Apart from this, I have also worked as Guest lecturer in various colleges of Kolkata (Asutosh college and Dinabandhu Andrews Institute) and in Sri Guru Tech Bahadur Khalsa College  University of Delhi. Overall, I have a teaching/research experience in the field of Economics for around 11 years. ",
        Education: [
          "Ph.D in Economics",
          "Jawaharlal Nehru University  (2018)",
          "M.Phil in Economics ",
          "Jawaharlal Nehru University (2013)",
          "M.Sc in Economics ",
          "University of Calcutta (Ranked 5th in the university) (2009)",
          "B.Sc (Hons.) in Economics ",
          "University of Calcutta (2007)"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Sharda University, Greater Noida",
          "Presidency University, Bengaluru",
          "Senior Programme Coordinator and Data Analyst in Public Health Resource Society (PHRS)",
          "Consultant in Public Health Resource Society (PHRS) ",
          "Research Associate in Ministry of Commerce and Industry",
          "Guest Lecturer, Sri Guru Tech Bahadur Khalsa College, University of Delhi",
          "Guest Lecturer, Asutosh College, University of Calcutta",
          "Part Time Lecturer in the Dinabandhu Andrews Institute of Technology and Management (DAITM),  Kolkata"
        ],
        Research: [
          " 1. Labour Employment",
          " 2. Policies affecting Rural and Urban Employment",
          " 3. Migration Issues and Labour policies",
          " 4. Gender Economics ",
          " 4. Agriculture "
        ],
        Projects: [],
        Distinction: [],
        profile:
            "https://www.bennett.edu.in/faculties/dr-priyanka-chatterjee/"),
    Faculty_model(
        Name: "Mr. Vikram Karuna",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/VikramB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "Mr. Vikram Karuna is an Assistant Professor in School of Law at Bennett University, Greater Noida. He has recently submitted his PhD thesis at Banaras Hindu University, Varanasi. He was awarded Junior Research Fellowship (JRF) in Law and Senior Research Fellowship (SRF) in Law from UGC, New Delhi for pursuing his doctoral degree. He is also an awardee of the Junior Research Fellowship in Human Rights and Duties from UGC, New Delhi. He has done LLM from Law School, Banaras Hindu University, Varanasi and LLB Honours from Faculty of Law, University of Lucknow, Lucknow. His research and teaching areas are Goods and Services Tax, Taxation Laws, Competition Law, Corporate Laws, IPR, Human Rights, etc.",
        Education: [
          "Ph.D. (Submitted) ",
          "Law School, Banaras Hindu University, Varanasi, India",
          "LL.M. ",
          "Law School, Banaras Hindu University, Varanasi, India",
          "LL.B. Honours ",
          "Faculty of Law, University of Lucknow, Lucknow, India",
          "Introduction to Industrial Property: Patents, Designs, Trademark ",
          "Politecnico di Milano, Milan, Italy/span&gt;General Course on Intellectual PropertyWorld Intellectual Property Organisation (WIPO), Geneva, SwitzerlandNET in Human Rights and DutiesUniversity Grants Commission, New Delhi, IndiaNET in Law University Grants Commission, New Delhi, India",
          "General Course on Intellectual Property",
          "World Intellectual Property Organisation (WIPO), Geneva, Switzerland",
          "NET in Human Rights and Duties",
          "University Grants Commission, New Delhi, India",
          "NET in Law ",
          "University Grants Commission, New Delhi, India"
        ],
        Experience: [
          "Assistant Professor, School of Law, Bennett University, Greater Noida, India",
          "Assisted in Teaching as a Doctoral Candidate, Law School, Banaras Hindu University, Varanasi, India"
        ],
        Research: [
          " 1. Goods and Services Tax (GST) ",
          " 2. Taxation Laws",
          " 3. Competition Law ",
          " 4. Corporate Laws ",
          " 5. IPR ",
          " 6. Human Rights "
        ],
        Projects: [],
        Distinction: [
          "Awarded Senior Research Fellowship (SRF) in Law by University Grants Commission, New Delhi, India, 2019.",
          "Awarded Junior Research Fellowship (JRF) in Law by University Grants Commission, New Delhi, India, 2017.",
          "Awarded Junior Research Fellowship (JRF) in Human Rights and Duties by University Grants Commission, New Delhi, India, 2018."
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-vikram-karuna/"),
    Faculty_model(
        Name: "Prof. Raghavendran Venugopal",
        Image:
            "https://www.bennett.edu.in/wp-content/themes/twentysixteen/images/faculty_details_image.png",
        Designation: "null",
        School: "Staff",
        Department: "null",
        Position: "null",
        Email: "null",
        About: "null",
        Education: [],
        Experience: [],
        Research: [],
        Projects: [],
        Distinction: [],
        profile:
            "https://www.bennett.edu.in/faculties/prof-raghavendran-venugopal/"),
    Faculty_model(
        Name: "Prof. Deepak Khazanchi",
        Image:
            "https://www.bennett.edu.in/wp-content/themes/twentysixteen/images/faculty_details_image.png",
        Designation: "null",
        School: "Staff",
        Department: "null",
        Position: "null",
        Email: "null",
        About: "null",
        Education: [],
        Experience: [],
        Research: [],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/prof-deepak-khazanchi/"),
    Faculty_model(
        Name: "Dr. Dayanand Pandey",
        Image:
            "https://www.bennett.edu.in/wp-content/themes/twentysixteen/images/faculty_details_image.png",
        Designation: "null",
        School: "Staff",
        Department: "null",
        Position: "null",
        Email: "null",
        About: "null",
        Education: [],
        Experience: [],
        Research: [],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-dayanand-pandey/"),
    Faculty_model(
        Name: "Mr. Saurabh Sood",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/SaurabhB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "He has submitted his Ph.D. thesis at the National Law School of India University Bengaluru in March 2021. He completed his  LL.M. in 2014 with a specialization in business laws from NALSAR University of Law, Hyderabad, and BALLB in 2012 from Himachal Pradesh University, Shimla. After completing post-graduation, he worked as a research assistant at DSNLU, Visakhapatnam where he was involved in teaching subjects such as private international law and international trade law to BALLB and LLM students. Currently, he is involved in teaching the Civil Procedure Code and Professional Ethics to undergraduate students at the School of Law, Bennett University.",
        Education: [
          "Ph.D.",
          "Ph.D (Pursuing) NLSIU, Bengaluru",
          "LL.M.",
          "NALSAR University of Law, Hyderabad",
          "BALLB",
          "Himachal Pradesh University, Shimla"
        ],
        Experience: ["Assistant Professor at Bennett University, India "],
        Research: [
          " 1. Business laws ",
          " 2. Human rights",
          " 3. International law  "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-saurabh-sood/"),
    Faculty_model(
        Name: "Dr. Shashi Bhushan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/ShashiB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "Dr Shashi Bhushan Ojha is currently working as Assistant Professor at School of Law. He has 3 and half years of teaching experience. Before joining Bennett University, he has worked as Assistant Professor at Symbiosis Law School, Noida and Law College Dehradun, Uttaranchal University, Dehradun. He has also worked briefly as Research Officer at Indian Institute of Public Administration, New Delhi. He also received full scholarship from International Institute of Humanitarian Law to attend training course on International Refugee Law.",
        Education: [
          "Ph.D.",
          "Jawaharlal Nehru University",
          "M.Phil. (International Law)",
          "Jawaharlal Nehru University",
          "LLM",
          "Uttarakhand Open Universityy",
          "LLB",
          "Banaras Hindu University",
          "B.Sc. (Physics, Mathematics, Statistics)",
          "Ewing Christian College, Prayagraj"
        ],
        Experience: ["Assistant Professor at Bennett University, India "],
        Research: [" 1. International Law "],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-shashi-bhushan/"),
    Faculty_model(
        Name: "Dr. Sanya Yadav",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/SanyaB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "Dr. Sanya Yadav is currently working as Assistant Professor at School of Law. She has eight years of teaching experience. Dr. Yadav has completed her Ph.D from National Law University, Jodhpur, Rajasthan in Perspectives on Indias International Investment Agreements and ISDS Law and Practice. Dr. Yadav holds LLM degree in International Trade Law  (Gold Medallist) from National University of Advanced Legal Studies Kochi, Kerala. She awarded as First Rank holder in LLM degree. The Nani. A. Palkiwala Memorial Trust Mumbai selected Dr Yadav for the prestigious Nani. A Palkivala Endowment Gold Medal Award on her outstanding academic excellence in LLM. ",
        Education: [
          "Ph.D. Perspectives on Indias International Investment Agreements and ISDS Law and Practice ",
          "National Law University Jodhpur, Rajasthan",
          "UGC NET (Law)",
          "LL.M. International Trade Law (Gold Medallist) ",
          "National University of Advanced Legal studies, Kochi, Kerala",
          "BA LLB (H) ",
          "Faculty of Law M.D University"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor, Faculty of Law, Manav Rachna University ",
          "Assistant Professor, Amity Law School, Amity University Rajasthan "
        ],
        Research: [
          " 1. International Investment Law ",
          " 2. International Trade Law  ",
          " 3. Contract Laws "
        ],
        Projects: [],
        Distinction: [
          "Dr Yadav Received Nani A Palkhivala Endowment Gold Medal Award by National University of Advanced Legal Sciences Kochi Kerala for the best student in law at the 8th Annual Convocation of the university held on 21st February 2015.",
          "Dr Yadav Received the Rank Certificate for the First Rank in LLM Degree Examination by National University of Advanced Legal Sciences, Kochi Kerala on 21st February 2015.",
          "Dr Yadav presided as Co  Chairperson in a Session of National Colloquium on Legal Education in India: Retrospect and Prospect February 27-28, 2016, Sponsored by Bar Council of India Trust, New Delhi at Mody University of science and technology Sikar (Rajasthan).",
          "Dr Yadav presided as Chairperson in a Technical Session in International Conference on current Development in Law Society and Economy 7th October 2018 conducted by MATS law School MATS University Raipur, Chhattisgarh.",
          "Professional Affiliation:",
          "1. Associate Member of International Society for Development and Sustainability, Japan",
          "2. Advisory Board Member in Indian Constitution Law Review, New Delhi",
          "3. ssociate Member of Indian Society of International Law, New Delhi since 2016",
          "4. Editor in Global Sports Policy Review",
          ""
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-sanya-yadav/"),
    Faculty_model(
        Name: "Dr Muzaffar Hussain Mir",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/MuzzafarB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "Dr. Muzaffar is currently working as Assistant Professor in the School of Law. He has completed his Ph.D. in the area of Criminal Law from the Faculty of Law, Jamia Millia Islamia. He has published his work in various journals and has presented his papers in various conferences both in India and abroad.  Recently, he was associated with the University of California, Irvine as a Research associate.",
        Education: [
          "Ph.D. ",
          "Jamia Milia Islamia, New Delhi 2021",
          "LL.M (Criminal Law) ",
          "Jamia Millia Islamia",
          "B.A. LL.B (Hons.) ",
          "University of Jammu"
        ],
        Experience: ["Assistant Professor at Bennett University, India "],
        Research: [
          " 1. Child Rights ",
          " 2. Criminal Law ",
          " 3. Criminology and Penology ",
          " 4. Jurisprudence and Legal Theory "
        ],
        Projects: [],
        Distinction: [
          "UGC - Junior Research Fellowship (2016)",
          "Completed winter course on Interactions between culture and Law in Europe and India in Tri-national Winter University  funded by L'Universit franco-allemande (UFA) - Deutsch-Franzsische Hochschule, and held at National Law University, Delhi from 20 to 26 February 2017 in collaboration with Universite Paris Ouest Nanterre LaDefense, France and Universitat Potsdam, Germany.",
          "Completed a Summer Course on Business and Human Rights jointly organized by Indian Law Institute and the Human Rights and Business Academy (HURBA), Hong Kong during July 3- July 8, 2017",
          "Member, Development Studies Association, United Kingdom- Membership No. 26569.",
          "Delivered invited Lecture, Child and Adolescent Substance Abuse: Issues and Challenges organized by Govt. Degree College, Pattan (U.T. of J&K) on July 06, 2020."
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-muzaffar-hussain-mir/"),
    Faculty_model(
        Name: "Dr. Chandrika Mehta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/ChandrikaB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "I pursued my masters in intellectual property rights from Gujarat National Law University. During my masters , I worked as a legal research associate for a project on Right To Education Act initiated by The National Commission For Protection Of Child Rights And GNLU. It was here that I developed a keen interest in research and teaching, and  enrolled myself for PhD at Rajiv Gandhi School of Intellectual Property Law, IIT kharagpur, where I was awarded institutional fellowship. I was interested in exploring interdisciplinary research during my stint at IIT, and was fortunate to work on a MHRD project on Future Of Cities. ",
        Education: [
          "Ph.D.",
          "IIT Kharagpur",
          "LL.M",
          "Gujarat National Law University",
          "B.A.,LL.B (Hons)",
          "Dr. Hari Singh Gour Vishwavidyalaya, Sagar"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Chettinad Academy Of Research And Education  ",
          "Assistant Professor Of Law at Hindustan University, Chennai"
        ],
        Research: [
          " 1. IPR ",
          " 2. Smart City Governance ",
          " 3. Technology Transfer "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-chandrika-mehta/"),
    Faculty_model(
        Name: "Dr. Abhishek Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/AbhishekB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "I am a researcher by calling and a teacher by profession. My inclination towards academia was formed during my undergraduate years while studying Political Science. To keep up with my interest in political and socio-economic issues, I decided to pursue LL.B. from the Faculty of Law, University of Delhi, where I was introduced to a range of opportunities to explore and expand my spectrum of research. After my LL.B., I worked as a law researcher for Delhi Judicial Academy and the renowned Constitutional law expert Prof. (Dr.) Mahendra Pal Singh (Professor Emeritus, University of Delhi). Thereafter, I decided to pursue my post-graduation in law from the prestigious Indian Law Institute (New Delhi), where I studied Criminal law and Corporate & Banking law as my specialisation papers. For my academic performance during the LL.M., I was awarded three gold medals by the Chief Justice of India in 2018. ",
        Education: [
          "Ph.D.",
          "Faculty of Law, Jamia Millia Islamia, New Delhi (2017-2021).",
          "LL.M. (Dual specialization in Criminal Law and Corporate & Banking Law)",
          "Indian Law Institute, New Delhi (2014-2016).",
          "LL.B. ",
          "Campus Law Centre, University of Delhi (2010-2013).",
          "B.A. (Honours) Political Science ",
          "Kirorimal College, University of Delhi (2007-2010). "
        ],
        Experience: [
          "Assistant Professor (Law), School of Law, Bennett University  ",
          "Assistant Professor (Law) at Amity Law School Faculty_model(Affiliated with GGSIPU, Delhi)  ",
          "Part-time Researcher with the Indian Law Institute and Central Information Commission on a project titled Transparency Audit of Public Institutions ",
          "Research Assistant to Prof. (Dr.) Mahendra Pal Singh, Professor Emeritus, University of Delhi ",
          "Law Researcher at Delhi Judicial Academy, Karkardooma Court Complex, Delhi"
        ],
        Research: [
          " 1. Criminal Law ",
          " 2. Constitutional Law ",
          " 3. Banking Law ",
          " 4. Islamic Banking & Finance ",
          " 5. Law & Religion"
        ],
        Projects: [],
        Distinction: [
          "Qualified UGC-NET in 2016.",
          "Awarded R.K. Anand Gold Medal for securing highest marks in LL.M. (2014-16).",
          "Awarded Late Shri M.K. Nambiar Gold Medal for Best Researcher (2014-16).",
          "Awarded Prof. K.N.C. Pillai Gold Medal for securing highest marks in Criminal Law Faculty_model(LL.M.-Specialisation) (2014-16)."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-abhishek-gupta/"),
    Faculty_model(
        Name: "Dr. Ankur Kashyap",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/10/ankur_kashyap310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "ankur.kashyap@bennett.edu.in",
        About:
            "His broad area is general & strategic management with a research interest in innovation, IPR, and entrepreneurship. He has obtained his Ph.D. degree from the Department of Management Studies, Indian Institute of Technology Roorkee, India. Dr. Ankur Kashyap has published his research work in different national/international Scopus indexed journals of repute. He has a mix of both teaching and research experience at reputed academic institutes.",
        Education: [
          " Ph.D., General and Strategic Management",
          " Indian Institute of Technology, Roorkee",
          "MBA, Marketing",
          "Uttar Pradesh Technical University ",
          " B-E-Com",
          " Agra University "
        ],
        Experience: [],
        Research: [
          "Strategic Management",
          "IPR creation & management ",
          "Innovation & Entrepreneurship "
        ],
        Projects: [],
        Distinction: [
          " Certification course on General Course on Intellectual Property from WIPO (World Intellectual Property Organization)."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ankur-kashyap/"),
    Faculty_model(
        Name: "Ms. Aarushi Batra",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/ArushiB.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "null",
        About:
            "After graduating from Panjab University, Chandigarh in 2012 with a B.A.LL.B. (Hons.) degree, I went on to pursue my Masters in Law (LLM) (2012-2014) from the Indian Law Institute in New Delhi, with a specialization in Intellectual Property Rights and Corporate Laws. It was during my time spent at the Indian Law Institute that I found my interest in teaching and research. Thereafter, I cleared my UGC-NET with JRF in Law in 2015, following which I joined the North Cap University, Gurugram as a Visiting Faculty (2015-2016). Over the period of one year that I spent there, I got an opportunity to teach upcoming and interesting courses like Media Law, Sports Law, International Environment Law, to a name a few. It was here that I was introduced to, and completely intrigued by a specialization in law called Sports Law that let me to pursue my doctorate in the area of Sports Law at the Faculty of Law, University of Delhi (2016-2021). ",
        Education: [
          "Ph.D. (Pursuing)",
          " University of Delhi ",
          "LL.M (2012-14), Intellectual Property Rights and Corporate Laws ",
          "Indian Law Institute, New Delhi",
          "B.A.LL.B (Hons.) (2007-12) ",
          "UILS, Panjab University, Chandigarh",
          "Qualified UGC-NET and JRF (2015)"
        ],
        Experience: [
          "Assistant Professor (Law), School of Law, Bennett University, Greater Noida, U.P. ",
          "Assistant Professor  Faculty of Law, SGT University, Gurugram, Haryana",
          "Visiting Faculty  School of Law, North Cap University, Gurugram, Haryana"
        ],
        Research: [
          " 1. Sports & Media Laws",
          " 2. Gender Justice ",
          " 3. Environment Law ",
          " 4. Human Rights "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/ms-aarushi-batra/"),
    Faculty_model(
        Name: "Dr. Daksha Sharma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Daksha-Sharma310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "daksha.sharma@bennett.edu.in",
        About:
            "Dr. Daksha Sharma has earned Bachelor of Socio-Legal Sciences degree and LL.B. degree (B.S.L.-LL.B.) from the Indian Law Society (I.L.S.) Law College, University of Pune and holds Masters in International Law (LL.M.) degree from the Department of Law, University of Pune wherein she submitted her dissertation on Judicial review of International Commercial Arbitral Awards in India: An Analysis. She has completed Ph.D. in International Law from the Indian Law Institute (I.L.I.), New Delhi on Streamlining the process of Intercountry Adoption in India: A Critical Study.  ",
        Education: [
          " Ph.D. (2015-20), International Law ",
          " Indian Law Institute,New Delhi ",
          " LL.M. (2012-14), International Law ",
          "  Department of LawUniversity of Pune, Pune, Maharashtra ",
          " Diploma in International Environmental Law (2014-15)  ",
          " Indian Society of International Law (ISIL), New Delhi ",
          " B.S.L.-LL.B. (2007-12) ",
          "  I.L.S. Law College, Pune University of Pune, Pune, Maharashtra ",
          "  General Course in Intellectual Property Laws, 2009",
          " WIPO Worldwide AcademyWorld Intellectual Property Organization (WIPO), Geneva, Switzerland ",
          " Diploma in Cyber Laws (2007-08) ",
          "Asian School of Cyber LawsPune, Maharashtra "
        ],
        Experience: [
          "  Assistant Professor (Law), School of Law, Bennett University, Greater Noida, Uttar Pradesh ",
          "  Visiting Faculty (Law), Indian Law Institute, New Delhi",
          "  Advocate, Supreme Court of India and Delhi High Court, New Delhi",
          " Visiting Faculty (Law), Delhi Police, Special Training Centre, Rajinder Nagar, New Delhi",
          " Visiting Faculty (International Law), Disha Law College (Affiliated to Pt. Ravishankar Shukla University), Raipur, Chattisgarh",
          " Assistant Professor (Law), Amity Law School, Centre-II, Amity University, Noida, Uttar Pradesh"
        ],
        Research: [
          "International Law ",
          "Human Rights ",
          "Alternative Dispute Resolution (A.D.R.) ",
          "Jurisprudence ",
          "Environmental Law "
        ],
        Projects: [],
        Distinction: [
          "Invited as an adjudicator in Think Indias 1st National E-Debate Competition 2020 and as a Judge in the semi-final rounds of Trust Legal, S.K. Misra Memorial Annual Mediation-Negotiation Competition, 2020, preliminary and octa rounds of the 21st, 23rd and 24th Stetson International Environmental Moot (India National Rounds), preliminary rounds of the G.D. Goenka- CIArb (India) International Commercial Arbitration Competition, 2018 and 2019, 34th Bar Council of India Trust Inter-University Moot Court and 58th Philip C. Jessup International Law Moot Court Competition, Surana & Surana,(India National Rounds).",
          " Invited as a Guest Speaker to deliver lecture on various law subjects by Chetna Conscience of Women, New Delhi, Think India, New Delhi, Human Rights Defense International, New Delhi, Manipur Upliftment Centre, Imphal, Manipur, Police Training School, Ujjain, Madhya Pradesh, National Human Rights Commission (NHRC), New Delhi, Dev Sanskriti Vishvavidyalaya (D.S.V.V.), Haridwar, Uttarakhand, Faculty of Law, Delhi University, New Delhi, Faculty of Law, S.G.T. University, Gurgaon, the Indian Institute of Mass Communications (IIMC), New Delhi, All India Reporter, Nagpur and Kendriya Vidyalaya, Ashok Nagar, Chennai, Tamil Nadu.",
          "Secured 2nd position in University of Pune in Masters of Law (LL.M. in International Law),(2012-14).",
          "Successfully cleared the UGC-NET, 2013 exam in Law, October 2013.",
          "Secured 7th position in University of Pune in IV BSL-LLB (2010-2011). ",
          "Awarded with S.Y. Abhayankar Scholarship by I.L.S. Law College, Pune (2010-2011).",
          "Secured 1st position in University of Pune in III B.S.L.-LL.B. (2009-2010).",
          "Secured 1st position in University of Pune in II B.S.L.-LL.B.(2008-2009).",
          "Secured 4th position in University of Pune in I B.S.L.- LL.B(2007-2008)."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-daksha-sharma/"),
    Faculty_model(
        Name: "Dr. Oly Roy",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/oly310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "oly.roy@bennett.edu.in",
        About:
            "I have been a Faculty at Amity Law School, Noida and Amity Law School Delhi, GGSIPU. I have completed my Graduation in History (Hons) from Presidency College, University of Calcutta and Masters, M.Phil and Ph.D. from Centre for Historical Studies, Jawaharlal Nehru University (JNU). I have been a Junior Research Fellow (JRF) at Indian Council for Historical Research (ICHR). I hold five years of experience in academic research. ",
        Education: [
          "Ph.D.",
          "Centre for Historical Studies, Jawaharlal Nehru University, 2017",
          " M.Phil.",
          "Centre for Historical Studies, Jawaharlal Nehru University in History, 2009-2011 ",
          " M.A. ",
          " Centre for Historical Studies, Jawaharlal Nehru University in History, 2009 ",
          "B.A. ",
          " Presidency College (University of Calcutta) with Honours in History, 2007"
        ],
        Experience: [
          " Assistant Professor, School of Law, Bennett University, Greater Noida",
          "Appointed as a Programme Leader for BBA.LLB (Hons) Programme, Amity Law School, Amity University, Noida",
          "Worked as an Assistant Professor (Grade I)of History at Amity Institute of Social Sciences, Amity University, Noida",
          "Worked as an Assistant Professor of History at Amity Law School Delhi, Guru Gobind Singh Indraprastha University Noida ",
          "Faculty Member of Quiz/Debate/Symposium Committee of Amity Law School, Delhi ",
          "Faculty Member of MUN/MIC Society of Amity Law School, Delhi ",
          "Worked as a History Visiting Faculty in Amity Institute of Social Sciences, Amity University"
        ],
        Research: [
          "Ancient Indian History ",
          "Gender History ",
          "Gender Related Issues "
        ],
        Projects: [],
        Distinction: [
          "Delivered a Lecture on Legal History for Amity Summer School, June, 2020 ",
          "Designed and Introduced Under Graduate Degree Course (BA.LLB.Hons & BA.LLB. Integrated) for History, Amity Law School, Amity University, Noida, 2020 Onwards ",
          "Appointed as a Programme Leader for BBA.LLB (Hons) Programme, Amity Law School, Amity University, Noida, December 2019 onwards ",
          "Worked as an Assistant Professor (Grade I)of History at Amity Institute of Social Sciences, Amity University, Noida from July, 2018 till September, 2018 ",
          "Worked as an Assistant Professor of History at Amity Law School Delhi, Guru Gobind Singh Indraprastha University Noida from December 2016 till June 2018 ",
          "Faculty Advisory Board Member, ALSD Student Journal: A Journal of Amity Law School, Delhi, Volume 6, 2017 (Peer-Reviewed Journal, UGC Approved Journal No. 42016, ISSN 2249-4421) ",
          "Faculty Member of Research Publications, Seminars and Conferences Committee of Amity Law School, Delhi  ",
          "Junior Research Fellow at Indian Council of Historical Research from May, 2015 till July, 2016",
          "Awarded Dr.Nasreen Ahmad Memorial Prize for the paper entitled Love And Infidelity In H\u0101las Sattasa\u012b in  Indian History Congress, Gour Banga University, Malda, 2015"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-oly-roy/"),
    Faculty_model(
        Name: "Mr. Siddharth Kanojia",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/01/siddhartKanojiya.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "siddharth.kanojia@bennett.edu.in",
        About: "",
        Education: [
          "Ph.D. (Pursuing)",
          "Corporate Law &amp; Governance, Symbiosis International (Deemed University), Pune",
          "LL.M (2015)",
          "International Business and Commercial Law, University of Manchester, UK",
          "LL.B (2011)",
          " Law, Faculty of Law, University of Delhi",
          "BBS (2008)",
          " Business Studies &amp; Finance, Shaheed Sukhdev College of Business Studies, University of Delhi "
        ],
        Experience: [
          "  Assistant Professor, School of Law, Bennett University ",
          "Assistant Professor (Law), Symbiosis Law School, NOIDA",
          " Legal Advisor, Lifetree World Limited, U.K",
          " Legal Consultant, CPA Global"
        ],
        Research: ["Taxation Law ", "Corporate Law ", "Corporate Governance"],
        Projects: [],
        Distinction: [
          "Awarded Junior Research Fellowship from UGC in Management in the year 2012",
          "Qualified UGC-NET in Management in the year 2012",
          "Qualified UGC-NET in Law in the year 2016 "
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-siddharth-kanojia/"),
    Faculty_model(
        Name: "Mr. Pallab Das",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Pallab-Das310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "pallab.das@bennett.edu.in",
        About:
            "Mr. Pallab Das completed his LLM from Swansea University, United Kingdom on an International Excellence Scholarship, 2015 with specialization in International Commercial and Maritime Law and his BSL.LLB from ILS Law College, Pune and was ranked 8th in Pune University. He got selected on scholarship and completed the Diploma in International Commercial Arbitration from Austrian Arbitration Academy, sommerhochshule, Vienna in 2018.",
        Education: [
          " Ph.D (Pursuing), 2018-2021",
          " National Law University, Odisha",
          "LLM (2015-2016), International Commercial and Maritime Law ",
          "Swansea University (The UK) ",
          " Diploma (2018), International Commercial Arbitration",
          " Vienna University, Austria 2018 ",
          " BSL. LLB (2012)",
          " ILS Law College, Pune "
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          " Faculty of Law, National Law University, Odisha ",
          " Associate Advocate, Lex Publicio Law firm, Bhubaneswar Odisha",
          " Civil Judge,  Sambalpur",
          " Assistant Advocate, High Court of Orissa"
        ],
        Research: [
          "Maritime Law ",
          "International Commercial Arbitration ",
          "International Investment Law"
        ],
        Projects: [],
        Distinction: [
          " Member Chartered Institute of Arbitrators, London ",
          " Associate Member, Asian Institute of Alternate Dispute Resolution, Malaysia ",
          " Brand Ambassador, Centre for Arbitration and Consultancy Development, India "
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-pallab-das/"),
    Faculty_model(
        Name: "Dr. Priya A Sondhi",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/priya-A-Sondhi310x310.png",
        Designation: "Associate Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "priya.sondhi@bennett.edu.in",
        About:
            "Prof.(Dr.)Priya A Sondhi is currently Associate Professor at Bennett University, Greater Noida. She was formerly the Associate Dean (Academics) at Asian Law College (ALC), Noida. She did her Bachelors and Masters degree courses from RashtrasantTukadoji Maharaj Nagpur University. She was first in the order of merit in both the courses and received Gold medals, Silver medals and cash prizes for the same. ",
        Education: [
          "P.hd (2017)",
          " Rashtrasant Tukadoji Maharaj Nagpur University",
          "PGDIPR (2012)",
          " IGNOU",
          " LLM (2004), Gold medallist ",
          " Rashtrasant Tukadoji Maharaj Nagpur University",
          "LLB (2001), Gold medallist",
          " Rashtrasant Tukadoji Maharaj Nagpur University",
          "BA (2002) ",
          " IGNOU"
        ],
        Experience: [" Associate Professor, Bennett University"],
        Research: [
          "International Law ",
          "Human Rights ",
          "Disaster Management Law "
        ],
        Projects: [],
        Distinction: [
          "Resource Person for the topic Disaster Management Law  Trends and challenges in the fourth One-week Short Term Online course in Disaster Management held on 23 - 28 August 2021 organized by the UGC-Human Resource Development Centre, JNU, New Delhi.",
          "Resource Peron for the topic, Human Rights, Ethics and Environment in the  Two Week Online Refresher Course in Environmental Studies held in July 2021 organized by the Department of Environmental Studies and Program Teaching Learning Centre, Ramanujam College, Delhi University.",
          "Resource Person for the topic Legal Regime of Disaster Management in three-day training program on Basic Principles of Disaster Management held on 23rd March -26th March 2021 organized by NIDM and Centre for Sustainable Development and Disaster Studies, School of Law, Bennett University, UP.",
          "Resource Person for the topic Constitutional Values and Education in the Fourth online faculty induction program held on 10th Feb-11th March 2021, organized by the UGC-Human Resource Development Centre, Jamia Millia Islamia, New Delhi.",
          "Resource Person for the topic  Disaster Management Law  Trends and challenges in the One week Short Term Online course in Disaster Management  held on 24 - 29 August 2020  organized by the UGC-Human Resource Development Centre, JNU, New Delhi.",
          "Resource Person for the topic  Disaster Management Law and Covid 19 in the Three-day Online short term program on Disaster Management for Covid 19 held on 14-16 July 2020 organized by the UGC - Human Resource Development Centre, Jamia Milia Islamia, New Delhi. ",
          "Resource Person for the topic  Disaster Management Law  Trends and challenges in the 2nd Short term course in Disaster Management  held on 3 - 8 February2020  organized by the UGC-Human Resource Development Centre, JNU, New Delhi. ",
          "Resource Person for the topic Motor Vehicle Act: Issues and Challenges in Claim Settlement, in the Training course on Management of Road Accidents held on 2-3 July 2012 organized by National Institute of Disaster Management (NIDM), New Delhi. ",
          "Former Member of Maharashtra State Government Committee for formulation of Rules under the Disaster Management Act 2005",
          "Legal inputs on Amendment to Disaster Management Act 2005 to National Institute of Disaster Management (NIDM), New Delhi in the year  2012.",
          "Legal Inputs on Centre State relations during Covid 19 to National Institute of Disaster Management (NIDM), New Delhi in the year 2020",
          " Legal inputs on Amendment to Disaster Management Act 2005 to National Institute of Disaster Management (NIDM), New Delhi in the year  2020."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-priya-a-sondhi/"),
    Faculty_model(
        Name: "Arpan Acharya",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/arpan310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "Arpan.acharya@bennett.edu.in",
        About:
            "I am a lawyer by training and my special papers in LLM were constitutional and international law. My LLM dissertation was on the idea of merit and reservations in India. Presently I am at the Centre for the Study of Law and Governance, Jawaharlal Nehru University, New Delhi where I wrote my MPhil dissertation on international refugee law under Prof. Jaivir Singh. Presently I am working on law and public sphere, specifically on the question of higher judiciary and what they have had to say about accountability for fundamental rights vis-a-vis the definition of 'state' in article 12 of the Indian Constitution; essentially the governance of public spaces and public utilities. A part of my PhD thesis will revolve around questions of common property resources and rights regimes around the same. I am trying to see how and where the judiciary can borrow ideas from political theory and economics to answer questions about state action better. Hence, I am using the spectrum of commons to anti-commons literature as a framing device for the idea of state action.",
        Education: [
          " Ph.D. (Pursuing), Constitutional Law and Economics",
          " Jawaharlal Nehru University (JNU) , New Delhi",
          " M.Phil (2015), International Refugee Law",
          "Centre for the Study of Law and Governance, Jawaharlal Nehru University, New Delhi",
          " LLM (2013), International and Constitutional Law ",
          "  National Law University, Odisha ",
          " BA-LLB (2011)",
          "Symbiosis Law School, Pune"
        ],
        Experience: [],
        Research: [
          " Constitutional law and the Public-Private continuum ",
          " Democratic Development in the Global South ",
          " Law and the Political-Economy"
        ],
        Projects: [
          "My present research looks at the judicial approach to the public-private question and the implications therein for ascription of constitutional liability for fundamental rights. The presumption is that the classic liberal approach, and the resultant state action doctrine, is not enough because it does not take into account the concept of power unlike Marxian or Foucauldian ideas of state and government."
        ],
        Distinction: [
          " Indian Council for Social Science Research (ICSSR) Doctoral Fellowship (2018) ",
          " ICSSR International Travel Grant for the International Political Science Association (IPSA) Conference in 2016",
          " Awarded the UGC NET for Assistant Professorship in January 2017"
        ],
        profile: "https://www.bennett.edu.in/faculties/arpan-acharya/"),
    Faculty_model(
        Name: "Ms. Swarnim Swasti",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/Swarnim-Swasti310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "swarnim.swasti@bennett.edu.in",
        About:
            "Swarnim holds a graduate degree from Jindal Global Law School, and a Master Degree from the University of Oxford, United Kingdom. She has spend a year of her undergraduate study at the University of California, Davis where she also interned with the United Nations Special Rapporteur in the field of Cultural Rights.Her areas of interest and research include Public International Law; International Human Rights Law; and, International Humanitarian Law. She has interned with the Supreme Court of Hawaii during her under-graduation program and with Amnesty International, United Kingdom during the course of her Master Degree. She had previously worked as  Research Fellow with Jindal Institute of Behavioural Sciences, and holds a co-authored chapter publication in INTERNET INFIDELITY: AN INTERDISCIPLINARY INSIGHT IN A GLOBAL CONTEXT (Sanjeev P. Sahni & Garima Jain eds., Springer 2018). She is a Commonwealth Scholar and has been actively involved in various conferences in capacities of member of organization team, participant, and speaker.",
        Education: [
          " MSt. (2018) International Human Rights Law",
          " University of Oxford, United Kingdom",
          "B.A.LLB. (2016)",
          "Jindal Global University, Sonipat, Haryana, India"
        ],
        Experience: [],
        Research: ["International Human Rights Law", "International Law"],
        Projects: [],
        Distinction: [
          "Recipient of Oxford-Commonwealth-Alan & Nesta Ferguson Graduate Scholarship 2016-2018 (Commonwealth Scholar)."
        ],
        profile: "https://www.bennett.edu.in/faculties/swarnim-swasti/"),
    Faculty_model(
        Name: "Dr. Mohammad Umar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/MohdUmar310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "Mohd.Umar@bennett.edu.in",
        About:
            "Mr Mohammad Umar is an Assistant Professor Law at Bennett University. Before joining here, he was working at Galgotias University for more than 3.5 years where he also founded and coordinated the Centre for Studies in International Law. He earned graduate/postgraduate degrees from Hidayatulllah National Law University, Jamia Millia Islamia and Jawaharlal Nehru University, New Delhi. Mr. Umar has published in areas like technology transfer and TRIPS, regulation of fake news, illicit wildlife trade, trade and competition, trade and environment, UN Peacekeeping, gender and personal law etc. His areas of interest are  International Trade Law, Global IPR Regime, Religion and Law, TWAIL and International Environmental Law. He has also been invited to speak at several institutions of national and international repute and has organized several conferences and symposiums.",
        Education: [
          " Ph.D., The Regulatory Framework for Combating Transnational Illegal Trade in Wildlife ",
          "Centre for International Legal Studies, Jawaharlal Nehru University, New Delhi",
          " M.Phil (2016), International Law",
          "Centre for International Legal Studies, Jawaharlal Nehru University, New Delhi",
          " LL.M. (2014), Triple Divorce in Classical Islamic Jurisprudence",
          "Jamia Millia Islamia, New Delhi",
          " B.A.LL.B.(2012), Honours in Constitutional Governance and International Trade Law",
          "Hidayatullah National Law University, Raipur, Chhattisgarh"
        ],
        Experience: [],
        Research: [
          " International Law ",
          " Human Rights ",
          "  IPR ",
          " Environmental Law ",
          "  Law and Technology "
        ],
        Projects: [],
        Distinction: [
          " External Reviewer- Environmental Policy and Law (IOS Press, Amsterdam), International Journal of Law and Social Sciences (Ansal University, Bangalore), Journal of Law Teachers of India (University of Delhi) ",
          " Chaired/Co-Chaired/Judged several national and international conferences and moots",
          " Written for- The Indian Express, Rising Kashmir, The Wire, FirstPost, LiveLaw and Daily",
          " Qualified UGC NET-JRF ",
          " Justice Rajagopala Ayyangar Summer Fellowship at the Inter-University Centre for IPR Studies, Cochin University of Science and Technology, Kochi (June-July 2018).",
          " Invited as a guest speaker at: NUALS, Kochi, Indian Society of International Law. New Delhi, Aligarh Muslim University, Indian Law Institute, New Delhi, Jamia Millia Islamia, New Delhi & SLS, CUSAT, Kochi ",
          " Gold Medal Awardee in Post-Graduation "
        ],
        profile: "https://www.bennett.edu.in/faculties/mohammad-umar/"),
    Faculty_model(
        Name: "Mita Kumar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/Mita-Kumar.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "mita.kumar@bennett.edu.in",
        About:
            "I hold a BA.LLB (Hons) from The National University of Juridical Sciences, Kolkata and an LLM with dual specialization in Criminal Law and Human Rights Law from The Indian Law Institute, New Delhi. In my masters thesis, I investigated on various Contemporary Issue in International Humanitarian Law. Before joining Bennett University, I clerked at the Punjab and Haryana High Court and worked as an intern with the UN Women, Gender Responsive Budgeting Team. My academic interests lie in Human Rights Law, International Humanitarian Law and Gender Studies. ",
        Education: [
          "LLM (2016), Human Rights Law, Criminal Law & International Humanitarian Law ",
          "The Indian Law Institute, New Delhi",
          "BA.LLB (Hons) (2013)",
          " WB, National University of Juridical Sciences, Kolkata"
        ],
        Experience: [],
        Research: [
          "  Human Rights Law ",
          "  International Humanitarian Law",
          "  Gender Responsive Budgeting "
        ],
        Projects: [],
        Distinction: [
          " Awarded the UGC NET for Assistant Professorship in December 2018 "
        ],
        profile: "https://www.bennett.edu.in/faculties/mita-kumar/"),
    Faculty_model(
        Name: "Dr Chasul Phogat",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/DR-CHASUL-PHOGAT-Assistant-Professor.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "Chasul.phogat@bennett.edu.in",
        About:
            "Freedom to make mistakes- a principle in which Mahatma Gandhi believed. I believe in the same and try to provide enough scope to the learners for Action during the classroom sessions. As a learner during my school years in Army school Akhnoor and JNV Odhan, Sirsa, I was fortunate to learn through experiential learning. Co-curricular activities were an essential component of our day to day teaching-learning process and these years taught me the importance of activities, which make the actual learning happen rather than using text-books and following the traditional methods of teaching. As a Digital native, I got enough acquaintance with technology in the form of computers. While teaching in a rural setting, I came across the lack of ICT resources for the academia community. It motivated me to carry out my research in the field of ICT and the adoption process. During my doctoral research at BITS Pilani, I got numerous opportunities to dig deeper into my research area which deals with ICT in Education in general and Communication in specific. During my research years (doctoral and postdoctoral both) I studied the educational policy documents of India and Hungary in order to observe and understand the importance given to ICT in the written text and to compare it with its actual presence in the educational institutions. My Postdoctoral Months at Eotvos Lorand University, Budapest not only expanded my existing knowledge in my research field but also widened my spectrum of perceiving and understanding things, situations and people.  ",
        Education: [
          "Postdoctoral research (2019), ICT in Teacher Education in a Hungarian Context",
          "Eotvos Lorand University, Budapest, Hungary",
          " Ph.D. (2018), Usage and Acceptance of IBPs by Communication Students in Indian Higher Education",
          "Birla Institute of Technology and Science, Pilani, Pilani campus",
          " MA (2011), English Literature and Language ",
          " University of Rajasthan, Jaipur ",
          " Bed (2009), English Language Teaching ",
          " Maharshi Dayanand University, Rohtak ",
          "BA Honors (2008), English Language, Literature, and linguistics",
          " IGNOU "
        ],
        Experience: [],
        Research: [
          " English Communication",
          " Educational Policy and implementation",
          "Teaching-learning process",
          " Acceptance Process of Technology"
        ],
        Projects: [],
        Distinction: [
          " Received Bi-lateral State Fellowship from Tempus Public Foundation for conducting Post-Doctoral level research in Hungary. ",
          "Received Stipundium Hungaricum Fellowship from Tempus Public Foundation for spending 2 semesters at Eotvos Lorand University, Budapest, during PhD (Received for 2 semesters, pursued only one semester). ",
          "Received institute fellowship from BITS Pilani, India for pursuing PhD "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-chasul-phogat/"),
    Faculty_model(
        Name: "Ms. Nidhi Chauhan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/08/Nidhi310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "nidhi.chauhan@bennett.edu.in",
        About: "",
        Education: [
          "Ph.D. - Pursuing",
          "Symbiosis International University, Pune",
          "LL.M (specialization: Business Law) (2018)",
          "National Law School of India University ",
          "LL.B. (2017)",
          "University of Delhi",
          "Company Secretary course (2013)",
          "ICSI",
          "B. Com (2010)",
          "University of Delhi"
        ],
        Experience: [],
        Research: [
          "Corporate and Commercial laws",
          "Environmental and Human Rights law"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/ms-nidhi-chauhan/"),
    Faculty_model(
        Name: "Dr. Prachi Tyagi",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/08/prachiTyagi310x310.jpg",
        Designation: "Assistant Professor (Law)",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "prachi.tyagi@bennett.edu.in",
        About: "",
        Education: [
          "Ph.D. (2020)",
          "Bhopal University",
          "LL.M (2014)",
          "NALSAR, Hyderabad (2nd Rank in the Batch)",
          "B.A.LLB (2012)",
          "Bhopal University (2nd Rank In the University)",
          "PG.D IPR (2013)",
          "NLSIU,Banglore",
          "PG.DISM (2011)",
          "Aptech"
        ],
        Experience: [
          "Assistant Professor (Law) - Bennett University",
          "Teaching Experience, Amity Law School,GGSIPU",
          "Industry Experience, Delhi High Court"
        ],
        Research: [
          "Competition Laws",
          "International Arbitration",
          "Corporate Laws"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/ms-prachi-tyagi/"),
    Faculty_model(
        Name: "Mr. Praveen Tripathi",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/05/Praveen310x310.jpg",
        Designation: "Assistant Professor ",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "praveen.tripathi@bennett.edu.in",
        About: "",
        Education: [
          "B.A.LL.B (2004  2009)",
          "Jiwaji University, Gwalior, Madhya Pradesh",
          "LL.M. (Business Laws) (2011  2013)",
          "National Law School of India University, Bengaluru ",
          "Ph.D. (Pursuing 2014 onward)",
          "National Law School of India University, Bengaluru "
        ],
        Experience: [],
        Research: [
          " ",
          "Securities and Investment Law",
          " Competition Law",
          " Law Relating to Civil Procedure"
        ],
        Projects: [],
        Distinction: [
          " ",
          "Securities and Investment Law",
          " Competition Law",
          " Law Relating to Civil Procedure"
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-praveen-tripathi/"),
    Faculty_model(
        Name: "Dr. Debabrata Baral",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/07/a2310x310.png",
        Designation: "Assistant Professor ",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "debabrata.baral@bennett.edu.in",
        About: "",
        Education: [
          "Ph.D. (2015)",
          "Sociology, Jawaharlal Nehru University, Delhi",
          "M.Phil. (2010)",
          "Sociology, Jawaharlal Nehru University, Delhi",
          "M.A. (2007) (with Distinction)",
          "Sociology, University of Hyderabad "
        ],
        Experience: [
          "Assistant Professor, School of law, Bennett University",
          "Post-Doctoral Research, funded by ICSSR affiliated in Jawaharlal Nehru University",
          "Research Associate in ICSSR funded project titled 'Mediation and Democracy' affiliated to Jawaharlal Nehru University",
          "Assistant Professor, School of liberal Studies, Ambedkar University Delhi",
          "Guest faculty at School of Business, Public Policy and Social Entrepreneurship at Ambedkar University Delhi",
          "Tutor/Teaching Assistant for Mphil in Centre for the Study of Social Systems, Jawaharlal Nehru University",
          "Research Associate for British Academia Funded project titled 'Labour Standards and the Working poor in China and India', School of Oriental and African Studies, University of London.",
          "Research Associate for British Academia Funded project titled 'The Global Village? Home working in the Global economy', School of Oriental and African Studies, University of London.",
          "Research Assistant in ICSSR funded Project titled 'Methodological trends in Sociology and Social Anthropology'",
          "Facilitator for women Self Help Group in Ministry of Human Resource Development funded project in Nagar Dia."
        ],
        Research: [
          "Sustainable and Inclusive Mining Sector",
          "Social Movements/local resistances against land acquisition for Developing projects ",
          "Conflicts over Interstate River Water Sharing in India",
          "Forest Rights and Other Traditional Forest Dwellers Act of India",
          "Corporate Social Responsibility",
          "Economic Sociology, Political Sociology"
        ],
        Projects: [],
        Distinction: [
          " POST-Doctoral Fellowship awarded by Indian Council of social Science Research, India, 2017.",
          " Senior Research Fellowship, awarded by University Grants Commission, India and Jawaharlal Nehru University, India, 2011.",
          "Junior Research Fellowship, awarded by University Grants Commission, India in June 2009. Best Student by MBBP, Odisha, 2007. ",
          " Post-Graduate Merit Scholarship, University of Hyderabad, 2007.",
          " Distinction in Master of Arts, 2007.",
          " Distinction in Bachelor of Arts, 2005.",
          " Selected for State Level science seminar organized by Directorate of Field Publicity, Government of India, 1998. ",
          " Selected for State Level science seminar organized by Directorate of Field Publicity, Government of India, 1997.",
          " Selected for State level science seminar organized by Directorate of Field Publicity, Government of India, 1996."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-debabrata-baral/"),
    Faculty_model(
        Name: "Ms. Bhumika Nanda",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/10_Ms.-Bhumika-Nanda-Assistant-Professor.jpg",
        Designation: "ASSISTANT PROFESSOR",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "bhumika.nanda@bennett.edu.in",
        About:
            "I started my teaching career at Institute of Law, Nirma University where I worked forfour years and held faculty advisor position at the Centre for International HumanitarianLaw and Human Rights Law. Before joining teaching position, I have had experience as aResearch Fellow in the Commons Cell and the Ministry of Housing and Urban PovertyAlleviation (HUPA) Chair on Urban Poor and the Law at NLSIU, Bangalore and as anassociate with Mahindro & Mahindro Advocates at Delhi District Courts and HighCourt. I have received LL.M. gold medal (International Humanitarian Law) from theNational Law School of India University (NLSIU), Bangalore and Sukhdevi Gridhari LalGrover Prize for Constitutional Law from Faculty of Law, Delhi University.My areas of interest are Human Rights Law, International Criminal Law, InternationalHumanitarian Law, Public International Law, Gender and Law and Private InternationalLaw",
        Education: [
          "LL.M in Human Rights Law (2 years Full Time Masters Degree 2011-2013)",
          " National Law School of India University, Bangalore",
          "LL.B. from Faculty of Law (2007-2010)",
          "Delhi University (Three Years)",
          "Bachelor of Arts (Honors.) Political Science(2004-2007)",
          " Ramjas College, Delhi University",
          "Qualified UGC-National Eligibility Test (NET)2012)"
        ],
        Experience: [],
        Research: [
          "1 International Criminal Law",
          "2.International Humanitarian Law.",
          "3.Private International Law",
          "4.Public International Law",
          "5.Gender and Law"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/ms-bhumika-nanda/"),
    Faculty_model(
        Name: "Dr. Suvir Kapur",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/07/suvir310x310.png",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "suvir.kapur@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2016)",
          "Political Science from Dr. Ram Manohar Lohia National Law University, Lucknow",
          "M.A. (2007)",
          "Public Administration, Pondicherry University, Pondicherry",
          "B.A. (Hons.) (2005)",
          "Political Science, Hindu College, Delhi University",
          "NET",
          "<span style=\"width: 100%;\">Political Science ",
          "Public Administration"
        ],
        Experience: [
          " Assistant Professor (Political Science), School of Law , Bennett University ",
          "Consultant Regional Evaluation Centre (North Zone) Indira Gandhi National Open University IGNOU, Lucknow"
        ],
        Research: [
          "Indian Political Thought",
          " Indian Government and Politics",
          "Public Administration"
        ],
        Projects: [
          "Institutional and Non-Institutional Structures Strengthening Grassroot Democracy at the National Seminar on Two Decades of 73rd Constitutional Amendment Act (Panchayat Raj): Experiences, Issues, Challenges and Opportunities with special Reference to Uttar Pradesh organized by Centre for Human Rights, Dr Ram Manohar Lohia National Law University, Lucknow February 5-6, 2016.",
          "Dr. B.R. Ambedkar: Dalit Awakening and Buddhism at the International Seminar on Dr. Ambedkars Global Vision: The Emerging Knowledge Society in 21st Century, organized by Babasaheb Bhimrao Ambedkar University, Lucknow. (A Central University) March 7-9, 2016.",
          "Politics of Identity and Development: With Special reference to Uttar Pradesh Elections 2017 at the 43rd All India Sociological Conference INDIAN SOCIOLOGICAL SOCIETY, Neo-Liberalism, Consumption and Culture Organized by: Department of Sociology, University of Lucknow 9-12 November 2017",
          "Jallikattu: Customs, Law and Politics at the 44th All India Sociological Conference INDIAN SOCIOLOGICAL SOCIETY, Reconstructing Sociological Discourse in India: Perspectives from the Margins, Organized by St Philomenas College (Autonomous), Mysuru, University of Mysore. 26-29 December 2018",
          "Deepening of Democracy in India: Opportunities and Challenges at the 58th All India Political Science Conference & International Conference on ASPIRING INDIA, Organized by INDIAN POLITICAL SCIENCE ASSOCIATION & Department of Political Science, Chaudhary Charan Singh University, Meerut 29-30 December 2018",
          "Impact of Western Ideals, Traditions, Institutions and Practices on Gandhi ji at the National Conference on  Contextualizing Mahatma Gandhis Philosophy in the 21st Century: Democracy, Justice, Equality and Non-Violence ,Sub Theme: T2 Issues of Culture ,Technical Session: T2.4 Gandhi and the Cultural Perspective organized by Dr. Ram Manohar Lohiya National Law University, Lucknow. (March 29-30, 2019)",
          "National Security : Issue of Consensus or Politics? 8th International Annual Research Conference of Symbiosis Law School, Pune on Rule of Law in Context: Indian and Global Perspectives (SYMROLIC 2019) (13th and 14th September 2019.)",
          "Environmental Politics in India: Environmental Protection vs Development at the 45th All India Sociological Conference (AISC) Environment, Culture and Development  Discourses and Intersections 27, 28 & 29 December 2019.) Kariavattom Campus, University of Kerala Thiruvananthapuram."
        ],
        Distinction: [
          "Indian Political Thought",
          " Indian Government and Politics",
          "Public Administration"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-suvir-kapur/"),
    Faculty_model(
        Name: "Dr. Suman Luhach",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/03/Dr.-Suman-Luhach-310x310.jpg",
        Designation: "Assistant Professor (English)",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "suman.luhach@bennett.edu.in",
        About:
            "I received my PhD degree from BITS Pilani, Pilani Campus in 2017. My observations on college students endeavours to pen down their ideas lead me choose Scaffolding Writing Skills for Indian College Students as my doctoral research topic. The work has contributed to an understanding of the importance of learning management systems to impact maximally in classroom instruction of writing skills through a learner- centric, collaborative approach. After being awarded the institutional fellowship in 2011, I taught courses like Technical Communication, Technical Report Writing and Effective Public Speaking at BITS Pilani to UG and PG students.  Prior to this I did M. Phil. in English Literature from MGS University, Bikaner in 2009 and wrote a dissertation on the works of V S Naipaul from a Postcolonial perspective. I qualified UGC NET (English - Language and Literature) in 2012. While doing a short-term course with RELO, US Embassy in 2012, I was awarded Outstanding Achievement in Exploring Web 2.0: Tools for classroom Teaching and Professional Development. During Masters (English Literature), I received Prof. SBL Rawat Memorial Trust Award for achieving 2nd rank at University level. I also wrote a dissertation on comparative analysis of  G B Shaws Caesar and Cleopatra and William Shakespeares Antony and Cleopatra in MA.  My research areas are Teaching of Writing Skills in Language Classrooms at Tertiary Level, Online Collaborative Language Learning, literary theories and Contemporary Drama.  I have also served as the co-convenor of Departmental seminars in the Department of Humanities and Social Sciences, BITS Pilani in 2013-14. I was a member of the editorial committee of BITSCAN- a biannual magazine of BITS Pilani, a member of the organizing committee in International Conference Interfacing Language, Culture and Technology held at BITS Pilani. ",
        Education: [
          "Ph. D. (2017)",
          "BITS Pilani, Pilani Campus ",
          "UGC NET (2012)",
          "",
          "M. Phil. (2009)",
          " MGSU, Bikaner"
        ],
        Experience: [],
        Research: [
          "Academic Writing",
          "Computer Assisted Language Learning",
          "Literary Theories",
          "Legal English",
          "Law and Literature"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-suman-luhach/"),
    Faculty_model(
        Name: "Dr. Garima Tiwari",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/11_Dr.-Garima-Tiwari-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "garima.tiwari@bennett.edu.in",
        About:
            "After graduating from National Law Institute University, Bhopal India in 2009with a B.A.LL. B (Hons) degree and taking a short stint with International TradeLaw, I worked for two years as a Law Associate (Faculty Dept.) at the NationalJudicial Academy, Bhopal. It was here that I developed my interest in research andteaching. I got a wonderful opportunity to work as a Senior Researcher withLexidale-International Policy Consulting, Cambridge Massachusetts. I conductedseveral research projects with them. I pursued my LL.M in International Crimeand Justice from University of Torino in collaboration with United NationsInterregional Crime and Justice Research Institute, Italy. I also earned a Masters inIntellectual Property Law from Indira Gandhi National Open University, India. Ico-founded an online research group AContrario International Criminal lawwhere we discuss global justice issues and engage in online and offline debates anddiscussions. In 2012 I was awarded the JusticeMakers Fellowship fromInternational Bridges to Justice, Switzerland on criminal justice reform and developed projects on spreading awareness on torture, legal aid and HIV/AIDS inprisons through engagement with different stakeholder. I won a full Scholarshipfrom the School of Advanced Studies, University of Camerino, Italy to pursue myPhD on the domestic effects of International Law. I worked on the Engagementof the Supreme Court of India with International Norms and was awarded theHighest Grade by the Committee. The PhD experience was worthwhile withbeautiful journeys to different countries. I spent visiting research periods at theCentre for Socio-Legal Studies, Faculty of Law, University of Oxford, UK andNordic Institute of Asian Studies, University of Copenhagen, Denmark. I wasawarded the 2016-18 Equality Knowledge Research Grant by the EasternMichigan University, United States for research on transgender rights. During myPhD, I published six law textbooks with LexisNexis, India. In addition, I haveauthored a course on contract law with LawSkills, Manupatra. I am on theeditorial and peer review boards of journals.",
        Education: [
          "B.A. LL.B(Hons.) (2009)",
          " National Law Institute University, Bhopal, India",
          "LL.M. In International Crime and Justice\u2014United (2012)",
          "Nations Interregional Crime and Justice Research Institute in collaboration with University of Torino, Italy.",
          "Masters in Intellectual Property Law",
          " Indira Gandhi National Open University, New Delhi, India",
          "Ph.D.",
          "University of Camerino, Italy. "
        ],
        Experience: [],
        Research: [
          "1.International Law.",
          "2. Gender studies.",
          "3. Human Rights.",
          "4. International Criminal law.",
          "5.Comparative Law"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-garima-tiwari/"),
    Faculty_model(
        Name: "Mr. Jacob George Panickasseril",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/13_Mr.-Jacob-George-Assistant-Professor.jpg",
        Designation: "Assistant Professor",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "jacob.panickasseril@bennett.edu.in",
        About:
            "I am a graduate of B.Sc. Chemistry from Madras Christian College, Chennai where I was the Department Representative and College Union Society Chairman. During my undergraduate days, I was involved in public interest issues such as environmental conservation and the Tsunami relief work which motivated me to pursue my LL.B. Faculty of Law, Delhi University where I was involved in AWAZ, a law student initiative on the Right to Information Act 2005. ",
        Education: [
          " (Chemistry)",
          "Madras Christian College, Chennai",
          "L L. B",
          "Faculty of Law, Delhi University, Delhi ",
          "L L. M",
          "NALSAR, Hyderabad"
        ],
        Experience: [],
        Research: [
          "Intellectual Property Rights Law",
          "Criminal Law",
          "International Dispute Settlement Mechanisms"
        ],
        Projects: [],
        Distinction: [
          "Advocate, Bar Council of Kerala (2009)",
          "JUGC-NET-JRF (2015)"
        ],
        profile: "https://www.bennett.edu.in/faculties/jacob-george/"),
    Faculty_model(
        Name: "Dr. Moina Khan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/Moina-Khan310x310.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "moina.khan@bennett.edu.in",
        About:
            "Dr. Moina Khan is an Assistant Professor in Times School of Media at Bennett University, Greater Noida. Dr. Khan holds a PhD in Community Radio studies and is a Post Graduate in Mass Communication from A.J.K Mass Communication Research Centre, Jamia Millia Islamia. She earned a fully funded Post Doctorate Research fellowship from Indian Council of Social Science Research. She has five years of teaching experience and has taught Radio, Mass Communication Theory, and Development Communication at the graduate and post graduate levels. She worked as a Radio Station Producer, producing the breakfast show with Meow 104.8FM-Indias First Just for Women Talk Radio Station, India Today Group. Dr. Khan also worked as a creative writer and freelance journalist with The Campus Paper and Youth500.com.  ",
        Education: [
          "  Post Doctorate (2019), Development Communication and Women Empowerment ",
          " Indian Council of Social Science Research, Delhi ",
          "  Doctorate (2015), Development Communication/Alternative Radio ",
          " Indira Gandhi National Open University, Delhi ",
          "  M.A(2007), Mass Communication ",
          " AJK Mass Communication Research Centre, Jamia Millia Islamia, Delhi "
        ],
        Experience: [
          "  Associate Professor, Bennett University ",
          "  Visiting Faculty, National Institute of Mass Communication, Delhi. (Punjab Technical University) ",
          " Assistant Professor, AJK Mass Communication Research Centre, Jamia Millia Islamia, Delhi",
          " CounsellorIndira Gandhi National Open University, Journalism and Mass Communication Programme. ",
          " Station Producer, Meow 104.8FM, India Today, Delhi. ",
          " Freelance Journalist and Creative Writer, Youth500.com/The Campus Paper"
        ],
        Research: [
          " Radio Studies ",
          " Participatory Communication ",
          " Development Communication ",
          " Women Empowerment ",
          "  Media Education "
        ],
        Projects: [],
        Distinction: [
          " Expert Reviewer, International Journal of Humanities and Social Sciences. 2013- 2015.  ",
          " National Women Excellence Award-2011, Government of India, The Young Achiever, Nav Kiran Award, 2011. ",
          " Working on show concept and structure along with my host and team, the show Meow Zindagi on Meow 104.8 FM received the highest RAM ratings (2010) in Delhi. It was one of the most popular shows among women. "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-moina-khan/"),
    Faculty_model(
        Name: "Sandeep Bhushan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/12/Sandeep-Bhushan-Bennett-University-1.png",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "sandeep.bhushan@bennett.edu.in",
        About:
            "I have been a TV journalist for more than 25 years. I have taught at the Centre for Culture and Governance, Jamia Millia Islamia. I have also been a freelance journalist. ",
        Education: [],
        Experience: [
          "Assistant Professor, Bennett University ",
          "Book Indian Newsroom Stars Studio and the Unmaking of Reporting ",
          "1. Media Studies to post-graduate students. Taught Media Policy and Media and Culture. ",
          "Senior Producer/Associate Editor ",
          "Independent Journalist ",
          "Senior Special Correspondent. ",
          " Researcher/Reporter "
        ],
        Research: [" Media Regulation ", "Media and Culture "],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/sandeep-bhushan/"),
    Faculty_model(
        Name: "Dr Tilak Jha",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/tilak-Jha310x310.png",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Tilak.jha@bennett.edu.in",
        About: "null",
        Education: [
          " PhD (2019), Chinese media ",
          " Jawaharlal Nehru University, New Delhi ",
          "M.Phil. (2013), Chinese media    ",
          "Jawaharlal Nehru University,New Delhi     ",
          "MA (2010) Convergent Journalism     ",
          "Jamia Millia Islamia, New Delhi ",
          "UGC Net (June 2012) Mass communication and journalism ",
          " UGC "
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          " Digital(China Journalist specialist), BBC     ",
          " Assistant Professor Amity University ",
          " Copy editor, Shanghai Daily, Shanghai, China",
          " Researcher cum staff writer, India Writes, New Delhi ",
          " Reporter, iSikkim.com      "
        ],
        Research: [
          " Media and foreign policy ",
          " Media in India, China and East Asia ",
          "India-China relations  ",
          " China studies "
        ],
        Projects: [],
        Distinction: [
          " Bai Xian Scholar (2014-2016) on Asian Future Leaders Scholarship at the Zhejiang University, Hangzhou, China.   "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-tilak-jha/"),
    Faculty_model(
        Name: "Bhavneet Singh Aurora",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/Bhavneet_S_Aurora310x310.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "bhavneet.aurora@bennett.edu.in",
        About:
            "Bhavneet Singh Aurora has worked full time in the print and digital news industry for nearly 20 years. Starting with the Indian Express in Chandigarh where he functioned as a reporter-cum-subeditor, he moved on to full time editing at Indian Express, Delhi, where he used to handle a special Sunday page on foreign news.",
        Education: [
          " MJMC (2000), Print Media",
          "Punjabi University",
          " BA (1998)    ",
          "Punjabi University"
        ],
        Experience: [
          " Associate Professor, Bennett University",
          " Senior Associate Editor, Hindustan Times Digital Streams Ltd",
          "  Associate Editor, India Today Group Digital",
          " Assistant Editor, Hindustan Times",
          " Assistant Editor, MetroNow",
          " Senior Sub Editor, Outlook Magazine",
          " Staff Writer, Indian Express "
        ],
        Research: [],
        Projects: [],
        Distinction: [
          "  Was Head of Opeations at indiatoday.in",
          "  Created a special interactive web page on the Uttarakhand floods (https://www.indiatoday.in/uttarakhand/deluge.html).",
          " Was involved in the creation of a new site for IndiaToday.in and a corresponding CMS in order to speed up story filing process. The new site and CMS were designed as per the requirements given by him. ",
          " Streamlined the filing of annual best colleges data for the microsite of the same (www.indiatoday.in/bestcolleges)"
        ],
        profile: "https://www.bennett.edu.in/faculties/bhavneet-singh-aurora/"),
    Faculty_model(
        Name: "Jatin Gandhi",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/Jatin-Gandhi310x310.png",
        Designation: "Consultant",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Jatin.gandhi@bennett.edu.in",
        About: "null",
        Education: [
          "MA English LlB",
          "Panjab University CCS University",
          "MA Mass Communication PGDJ",
          "Kurukshetra University Asian College of Journalism"
        ],
        Experience: ["Consultant, Bennett University"],
        Research: [
          "Trust in Media",
          "Fake News",
          "Digital Media",
          "Social Media-Journalism interface",
          "Disinformation",
          "Media Laws",
          "Cyber laws",
          "Indian politics and policy",
          "Political communication and narratives"
        ],
        Projects: [],
        Distinction: [
          "ICFJ Knight International Journalism Fellow, 2018-19",
          "Chevening SAJP Fellowship 2016-17"
        ],
        profile: "https://www.bennett.edu.in/faculties/jatin-gandhi/"),
    Faculty_model(
        Name: "Vidhanshu Kumar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/Vidhanshu-Kumar.png",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Vidhanshu.kumar@bennett.edu.in",
        About:
            "Vidhanshu Kumar bears the distinction of working in all forms of media: Print, TV, Radio, Online, and News Agencies. Vidhanshu also is Indias first Television news journalist to have covered test cricket outside of India. He began his career with the Asian Age and then moved on to television. He has been part of the launching teams of Sahara Samay, IBN 7 and News X channels.",
        Education: [
          " MA, MAMC     ",
          "  GJUST",
          " NET, UGC NET ",
          "  UGC",
          " PG Diploma in Journalism, Indian Institute of Mass Communication ",
          "  IIMC, Ministry of Information and Broadcasting, Govt. of India ",
          " BA, Bachelors of Arts ",
          "  Delhi University "
        ],
        Experience: [
          "  Assistant Professor, Bennett University",
          "  Senior Producer Mumbai, ESPN Star Sports, Cricinfo",
          "  Assistant Professor, Amity University Uttar Pradesh",
          "  Senior Multimedia Producer, British Broadcasting Corporation (BBC)",
          "  Guest Speaker, IIMC Academic Coordinator IIMC, Freelance Producer for ESPN, Sony Ten    IIMC, Freelance Producer",
          " Executive Producer, News X",
          "  Senior Correspondent, ESPN Star Sports",
          "  Correspondent, IBN News",
          "  Reporter, Sahara Samay TV",
          "  Sub editor cum reporter, The Asian Age Newspaper "
        ],
        Research: [
          " Participatory Communication",
          " Mediatization",
          "Media Practices and Research  ",
          " Political Economy of Sports"
        ],
        Projects: [
          "Funded Project (International Republican Institute, Washington, USA  USD 2000 Political Parties in the Digital Age",
          "Media Action Against Rape (MAAR) , funded by UNESCO",
          "Aftershock Nepal: Chronicling rebuilding of Nepal post the earthquake of April 2015.",
          "Project India",
          "Short Documentary - KUKKI"
        ],
        Distinction: [
          "  Produced award winning shows on ICC WORLD CUP and IPL for ESPN and Star Sports ",
          "  Invited as guest writer, speaker for various international and national media houses like the BBC, SBS Australia, Sports Illustrated, Golf INC USA, Doordarshan, Rajya Sabha TV, News 24, Outlook, Employment News,  Mumbai Mirror etc. ",
          "  I was part of expert committee that worked to re-launch Community Radio Station,  Radio Haldwani ",
          "  Award winning employer for ESPN -for popular program Sports Center ",
          "  Attended the 2nd Refresher Course in Academic Staff College, Jamia Millia Islamia, Jan 2014, Conducted by the UGC "
        ],
        profile: "https://www.bennett.edu.in/faculties/vidhanshu-kumar/"),
    Faculty_model(
        Name: "Dr. Shilpi Jha",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/shilpi-Jha310x310.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Shilpi.jha@bennett.edu.in",
        About:
            "Dr. Shilpi Jha is a TV journalist and academician with about two decades of work experience in India and US. She started her career with Aaj Tak and was part of the launch team of Indias most renowned news channel. She has also worked with the Voice of America as International Broadcaster, Hindi Service, at their Washington headquarters. She has been an academician for over a decade now, teaching courses like TV Journalism, Media Economics and Media Research. She has also been a columnist with several renowned news websites and has been participating in TV shows as expert.  She is also an avid blogger and writes on social and women issues.",
        Education: [
          " PhD(2014)",
          " Media Economics",
          " UGC NET (2010)",
          "Journalism and Mass Communication ",
          " MA (2009)",
          "Journalism and Mass Communication",
          " PG Diploma in Journalism(2000)",
          "Indian Institute of Mass Communication ",
          " BA Economics Hons (1999) ",
          "Patna University "
        ],
        Experience: [
          " Associate Professor, Bennett University",
          " Associate Professor, GD Goenka University",
          "  Guest/Adjunct Faculty, IP University; Manav Rachna International University, Makhanlal Chaturvedi National Journalist University, and JIMMC Noida",
          "  International Broadcaster, Hindi Service, Voice of America, Washington DC ",
          "Business Correspondent, Aaj Tak, TV Today Network "
        ],
        Research: [" TV Journalism ", " Media Economics"],
        Projects: [],
        Distinction: [
          " Google certified Fact Checking and Online Verification Expert, part of Google News Initiative, India Training Network, has trained over 250 journalists and 150 journalism students on tools and techniques of fact checking and online verification   ",
          " Recipient of Exceptional Women of Excellence from Women Economic Forum, April 2019",
          "Recipient of Rajasthan Patrika Award for Academic Excellence at Indian Institute of Mass Communication  "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-shilpi-jha/"),
    Faculty_model(
        Name: "Dr. Sanjay Verma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/Sanjay-Verma310x310.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "sanjay.verma@bennett.edu.in",
        About:
            "The faculty has over two and a half decades of experience in active Hindi journalism. During this time period he has held various positions in Navbharat Times, Amar Ujala and daily Himalaya Darpan. In addition to working as a reporter for Navbharat Times, he wrote thousands of editorials and articles in the editorial department. He has had a long experience of working on the front page in addition to serving as the main desk incharge in the news desk. As a freelancer in various journals of the country, he has made an active contribution for a long time.Apart from the Times Group's prestigious Chairmans Award, Udayan Smriti Journalism Award, Navbharat Times' Wow Award and Kadambini Sahitya Mahotsav, organized by Hindustan Times, were awarded the first prize for story writing in 1995 for this contribution.",
        Education: [
          "PhD    Hindi Journalism ",
          "  Gurukul Kangri University, Haridwar ",
          "M.A.     Hindi Literature",
          " Gurukul Kangri University, Haridwar ",
          " B.Com.    Commerce",
          " IGNOU, Delhi"
        ],
        Experience: [
          "  Associate Professor, Bennett University",
          " Senior Assistant Editor, Navbharat Times (Times Group)",
          " Sub Editor, Amar Ujala Prakashan, Meerut",
          " Sub Editor, Himalaya Darpan, DehraDun",
          "  Assistant Reporter (voluntary)     Navbharat Times (Haridwar)"
        ],
        Research: [
          " Hindi Journalism",
          " Crypto Currency",
          "Artificial Intelligence "
        ],
        Projects: ["Science Journalism"],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-sanjay-verma/"),
    Faculty_model(
        Name: "Dr Rahul Dass",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/11/KLETech-Hubli-1.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "rahul.dass@bennett.edu.in",
        About:
            "Dr Rahul Dass is a journalist with over two-and-a-half decades of rich experience. He has worked in leading English dailies including The Hindustan Times and The Tribune. He also had a long stint as a Senior Editor with the news wire, Indo-Asian News Service. He holds a PhD degree and is a graduate in journalism from Delhi University.",
        Education: [
          " Ph.D (2009), Challenges of terrorism to peace process in the Indian perspective    ",
          "  CCSU Meerut",
          "MA (1997), Political Science",
          "  Delhi University ",
          "BA Honours (1994), Journalism",
          "  Delhi University "
        ],
        Experience: [
          " Associate Professor    Bennett University",
          "Senior Assistant Editor, Hindustan Times",
          "Deputy Editor, Governance Now",
          "Senior Editor, Indo-Asian News Service",
          "Senior Staff Correspondent, The Tribune",
          "Staff reporter, The Statesman",
          " Reporter, Delhi Mid Day"
        ],
        Research: [
          " New Media",
          " Artificial Intelligence and mass communication"
        ],
        Projects: [],
        Distinction: [
          " Participated in Group Study Exchange of Rotary International to France "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rahul-dass/"),
    Faculty_model(
        Name: "Dr. Anvesha Sharma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/03/Dr.-Anvesha-Sharma.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "anvesha.sharma@bennett.edu.in",
        About: " ",
        Education: [
          "Ph.D.(2018), Advertising Management",
          "Mahatma Gandhi University",
          "MBA (2009), Marketing",
          "Madurai Kamraj University",
          "B.A. (2007), Communicative English with Media Studies",
          "Patna University"
        ],
        Experience: [
          "Associate Professor, Bennett University, India ",
          "Assistant Professor, Amity University",
          "VAC Manager, IMI Mobiles Pvt. Ltd",
          "Brand Services Executive, LOWE Kolkata"
        ],
        Research: [
          "The new forms of advertising and its impact on business and users ",
          "Digital Marketing Avenues",
          "The virtual management system",
          "Social CRM and Digital PR"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-anvesha-sharma/"),
    Faculty_model(
        Name: "Gunjan Sharma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/03/gunjanSharma310x310-Bennett.jpg",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Gunjan.sharma@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. Pursuing ",
          "GD GOENKA University",
          "MA (Journalism & mass Communication) (2004)",
          "Institute of Professional Studies",
          "BSc (2001)",
          "Sagar University"
        ],
        Experience: [
          "Assistant Professor, GD Goenka University, India ",
          "Head, Media Centre, YWCA OF Delhi",
          " Sr. Lecturer, IMS Unison University ",
          "Producer & editor, Riverbank Studios Pvt. Ltd"
        ],
        Research: [
          "Film Studies, Documentary film making ",
          "Photography",
          "Television Production"
        ],
        Projects: [],
        Distinction: [
          "Segment producer and Video Editor of multiple award winning longest running tv magazine program in India EARTH MATTERS."
        ],
        profile: "https://www.bennett.edu.in/faculties/gunjan-sharma/"),
    Faculty_model(
        Name: "Dr. Nithin Kalorth",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/Mr.-Nithin-Kalorth-Assistant-Professor-Digital-Photography.jpg",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "News Design",
        Position: "null",
        Email: "nithin.kalorth@bennett.edu.in,",
        About:
            "Nithin Kalorth is Assistant Professor in School of Media and Liberal Arts at Bennett University. He holds a PhD in Mass Communication and Journalism from Gandhi University. His thesis explored Tamil new wave cinema and its epistemological relation between Dravidian ideology and culture. He earned his post-graduation from the University of Madras with first rank and gold medal in Electronic Media and cleared UGC NET with JRF. He is actively involved in documentary film making and digital photography projects.",
        Education: [
          "PhD Mass Communication and Journalism",
          "2017)",
          "Mahatma Gandhi University, India",
          "UGC NET Mass Communication and Journalism (2011)",
          "University Grants Commission, India",
          "M.Sc Electronic Media (2011)",
          "University of Madras, India",
          " Visual Communication (2009)",
          " University of Madras, India"
        ],
        Experience: [
          "Associate Professor, Bennett University",
          "Assistant Professor,School of Communication, Amity University, Jaipur",
          "Junior Research Fellow,Mahatma Gandhi University, Kerala",
          "Faculty, IFD Group of Education, Kerala"
        ],
        Research: [" Film Studies", "New media", "Cultural Studies"],
        Projects: [],
        Distinction: [
          "Member, ",
          " Research Studies Network.",
          "Scientific Board Member, Communication and Media Research Centre, European Union."
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-nithin-kalorth/"),
    Faculty_model(
        Name: "Ms. Shruti Jain",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/Ms.-Shruti-Jain-Associate-Professor.jpg",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "shruti.jain@bennett.edu.in",
        About:
            "Shruti Jain is an award winning global marketing and communications professional with expertise across B2C and B2B industries. Adept at digital and traditional branding tools, she has deep experience in driving profitable growth on both the agency and client side. She has around 25 years of work experience across multinational conglomerates with stints in Human Resources and Solutioning. Shruti specializes in looking at business issues and providing strategic marketing and communication solutions. She has held several global C-suite positions across Marketing, Communications, Sustainability, Human Resources, Diversity and Solutioning for one of the fastest growing outsourcing and analytics firms, EXL Service. She has also worked in leading advertising agencies such as Ogilvy, Mudra, Rediffusion DYR and Dentsu, and has handled all aspects of integrated marketing communications.",
        Education: [
          "2010",
          "Corporate Social Responsibility, Harvard Business School, USA",
          "2011",
          "Strategic Human Resource Management, Indian Institute of Management, Ahmedabad",
          "2013",
          "Mass Communication, Hisar University",
          "1994",
          "Advertising &amp; Public Relations, Indian Institute of Mass Communication (IIMC)",
          "1993",
          "English (<gs id=\"62833a86-cd1f-494e-be48-422ed7807f7b\" ginger_software_uiphraseguid=\"1e3cfb0b-c71e-4137-a1ad-2303a1aed688\" class=\"GINGER_SOFTWARE_mark\">Honours</gs>), Delhi University"
        ],
        Experience: [
          "Associate Professor, ",
          " ",
          "Global Head - Solutioning, EXL Service",
          "Chief Communications & Sustainability Officer; Head of India Business HR - Operations, EXL Service",
          "Chief Communications Officer & Global Head  HR Tech, EXL Service",
          "Global Head  Marketing & Communications, EXL Service",
          "Vice President & Head, Dentsu Creative Impact",
          "Associate Vice President & General Manager, Rediffusion DYR",
          "Management Supervisor, Ogilvy ",
          "Progressive roles",
          " Ogilvy, Mudra"
        ],
        Research: [
          "Marketing & Communication",
          "Technology, automation and digitization ",
          "Consumer Insights & Cultural Sensitivity",
          "Diversity & Inclusion"
        ],
        Projects: [],
        Distinction: [
          " Team of the Year: Innovation, EXL Service, 2016",
          " Corporate Excellence Award  Marcom Category, IPE 2012",
          " Value Ambassador Award, EXL Service, 2009 and 2008",
          " PRSI Award  Course Topper, Indian Institute of Mass Communication (IIMC), 1994",
          " All Round Best Student Award/Topper, Delhi University, 1993",
          " More than 16 years of experience as External Faculty for Marketing/Communications and Member of the Selection/ Viva Committee at various prestigious academic institutions "
        ],
        profile: "https://www.bennett.edu.in/faculties/ms-shruti-jain/"),
    Faculty_model(
        Name: "Vidya Deshpande",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/Vaidya.jpg",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "vidya.deshpande@bennett.edu.in",
        About:
            "Vidya Deshpande has worked as a print and television journalist for over 25 years. Among the news organizations she has worked for are The Times of India, The Pioneer, The Financial Express and India Today TV (formerly Headlines Today.) She has written extensively on a variety of topics including environment, social development, public health, lifestyle, food and travel. Vidya has a Masters-level Diploma in Journalism, and an Executive MBA from the Indian Institute of Management, Lucknow. ",
        Education: [
          "MBA (2012-2013)",
          "General Management Programme for Executives, IIM Lucknow",
          "PG Dip in Journalism (1986-87)",
          "Indian Inst of Mass Communication, New Delhi",
          "B.Sc (1986)",
          "Bangalore University"
        ],
        Experience: [
          "Set up a Start-up travel company only for women",
          "Managing Editor, IS2 Magazine of Amar Ujala Group",
          "Associate Executive Producer, Tv Today Netork",
          "Special Correspondent, Sahar Samay National TV",
          "Consultant Editor UNICEF & Wildlife Trust of India",
          "Assistant Editor, The Financial Express",
          "Principal Correspondent, The Pioneer, New Delhi",
          "Reporter, The Times of India, New Delhi",
          "Sub Editor, The Financial Express",
          "Reporter Deccan Herald, Bangalore",
          "Reporter, The City Tab "
        ],
        Research: [],
        Projects: [],
        Distinction: [
          " Member, Indian Womens Press Corps",
          "Been on 2 International delegations of women journalists to China & Sri Lanka "
        ],
        profile: "https://www.bennett.edu.in/faculties/vidya-deshpande/"),
    Faculty_model(
        Name: "Ms. Pallavi Bansal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/12/Pallavi-Bansal310x310.jpg",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "pallavi.bansal@bennett.edu.in",
        About:
            "Pallavi Bansal has done her MSc in Media, Communication and Development from the London School of Economics and Political Science, and has worked with the United Nations in Geneva and The Times of India in Delhi. She specializes in digital journalism and has also worked with a France-based news aggregator app News Republic. She was awarded the Gold Medal for securing first position among seven colleges of the Guru Gobind Singh Indraprastha University in the graduation course. ",
        Education: [
          "Ph.D (Pursuing)",
          "Ethical design of AI-run digital labour platforms, Erasmus University Rotterdam, The Netherlands",
          "MSc Media, Communication and Development",
          "London School of Economics and Political Science, UK",
          "Bachelor of Journalism (Mass Communication)",
          "Jagannath International Management School, Vasant Kunj (Affiliated to GGSIPU)"
        ],
        Experience: [
          "Assistant Professor, Times School of Media, Bennett University ",
          "Assistant Editor, Cheetah Mobile Inc (News Republic) ",
          " Copy Editor, The Times of India.com (Lifestyle) ",
          "Intern United Nations Office at Geneva, Switzerland ",
          "Copy Editor, The Times of India.com (Entertainment)"
        ],
        Research: [
          "Ethics and Artificial Intelligence",
          "Digital Media",
          "Development Communication",
          "Mobile Journalism"
        ],
        Projects: [],
        Distinction: [
          "External Researcher with Feminist Approaches to Labour Collectives (FemLab.co), a seed-funded initiative by the International Development Research Centre (IDRC), Canada.",
          "Awarded Certificate of Excellence by The Times of India in 2015 for contribution to the Lifestyle Section of the website.",
          "Received Gold Medal for securing first position among 7 colleges of the Guru Gobind Singh Indraprastha University in her graduation studies."
        ],
        profile: "https://www.bennett.edu.in/faculties/ms-pallavi-bansal/"),
    Faculty_model(
        Name: "P. Ramesh Kumar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/P-Ramesh.jpg",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "ramesh.kumar@bennett.edu.in",
        About:
            "P. Ramesh Kumar has a rich experience in journalism having worked in Indian and international newspapers for over three decades.  Among the newspapers he has worked with are The Times of India, Business and Political Observer, Hindustan Times, Oman Tribune, Khaleej Times and Gulf Daily News. Ramesh is also a columnist and writer and has written on subjects including Sri Lanka affairs, Middle East politics, nuclear politics and the environment. He has edited a book (2015); an English translation of Kannada litterateur Kuvempu's works for the Karnataka government (2015); and some issues of an academic journal (Studies in History) of JNU's Centre for Historical Studies (2013).",
        Education: [
          "MA English (1980-82)",
          "Delhi University",
          "BA (1977-80)",
          "Delhi University",
          "Diploma in Journalism(1982-83)",
          "Bharatiya Vidya Bhavan"
        ],
        Experience: [
          "Assistant Professor at Bennett University ",
          " Assistant Editor, The Times of India ",
          "News Editor, Oman Tribune ",
          "Chief Sub-Editor, Khaleej Times",
          "Gulf Daily News, Sub-Editor",
          "Bus & Political Observer Senior Sub-Editor",
          "Hindustan Times Sub-Editor",
          "Newstime Sub-Editor"
        ],
        Research: [
          "Sri Lanka politics",
          "Global and nuclear politics",
          "Environment studies",
          "Crimes against women",
          "Middle East politics "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/p-ramesh-kumar/"),
    Faculty_model(
        Name: "Dinesh Jaisinghani",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/10/Dinesh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "Finance Management",
        Position: "null",
        Email: "Dinesh.Jaisinghani@bennett.edu.in",
        About:
            "Dinesh Jaisinghani is currently working as an Assistant Professor at School of Management, Bennett University, India. He has done his Fellow Program in Management from IMI, New Delhi. He has completed his PGDM from FORE School of Management, New Delhi. He has published several research papers and case studies in reputed national and international journals. He has conducted several workshops in advanced econometrics and time series analysis. His primary area of research pertains to modeling financial performance using advanced econometrics and panel data analysis. ",
        Education: [
          "FPM (2017)",
          "IMI, New Delhi",
          "PGDM (2008)",
          "FORE School of Management, New Delhi",
          "B.Com (2006))",
          "University of Mumbai"
        ],
        Experience: [
          "Assistant Professor, at Bennett University",
          "Assistant Professor, FIIB, New Delhi",
          "Assistant Professor, IMT Hyderabad",
          "Equity Research Analyst, Adventity Global Solutions"
        ],
        Research: [
          "Corporate Finance",
          "Emerging Markets",
          "Financial Econometrics",
          "Corporate Governance"
        ],
        Projects: [],
        Distinction: [
          "UGC NET Qualified",
          "Have conducted MDPs for Private Sector and Government Employees",
          "Have conducted advanced FDPs on Time-Series and Panel Data Econometrics"
        ],
        profile: "https://www.bennett.edu.in/faculties/dinesh-jaisinghani/"),
    Faculty_model(
        Name: "Dr. Gyanesh Kumar Sinha",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/01/gyaneshSinha310x310.png",
        Designation: "Associate Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "gyanesh.sinha@bennett.edu.in",
        About: "null",
        Education: [
          "  Ph.D. (2013) ",
          "  Industrial Engg. &amp; Management, Indian Institute of Technology (ISM), Dhhanbad ",
          " UGC-NET  (2012) ",
          "Management, UGC",
          "M.Tech  (2000) ",
          " Industrial Engg. &amp; Management,Indian Institute of Technology (ISM), Dhhanbad ",
          "B.E (1998) ",
          " VNIT (formerly VRCE), Nagpur "
        ],
        Experience: [
          "  Associate Professor -GD Goenka University, Gurgaon",
          " Assistant Professor -Army Institute of Management & Technology, Greater Noida",
          "  Assistant Professor -G L Bajaj Institute of Management and Research, Greater Noida ",
          " Sr. Lecturer-Ishan Institute of Management & Technology, Greater Noida ",
          " Web Consultant -Skyweb India (P) Ltd, Noida "
        ],
        Research: [
          "Water Resource Management ",
          " Sustainable supply chain and logistics management ",
          "Carbon credit ",
          "Human resource management ",
          "Productivity "
        ],
        Projects: [],
        Distinction: [
          " Received the Award of Honor for Conducting and coordinating EDP for ORIENT FANS  ",
          " Conducted MDP/EDP on supply chain and logistics management for middle and senior level executives of IRCTC, Container Corporation of India, Central Warehousing Corporation, Air India, Yamaha Motors, Indian Port Association, CPWD etc",
          " Delivered lectures on Literature Review to Ph.D Scholars of Gujrat National Law University, Gandhi Nagar",
          " Awarded Distinguished Faculty at G L Bajaj Institute of management and Research, Greater Noida",
          " Received Certificate of Appreciation for conducting Faculty Development Programme at Army Institute of Management & Technology, Greater Noida",
          " Empaneled at IGNOU, New Delhi for Question Paper Setting and Moderation of subjects of MBA, B.Tech (Mechanical Engineering) and B.Tech (Civil Engineering) ",
          " Delivered Lectures for IGNOU on EDUSAT Programme  (Telecasted on Doordarshan Channel  GYANDARSHAN) on Production and Industrial Management"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-gyanesh-kumar-sinha/"),
    Faculty_model(
        Name: "Dr.\u200c \u200cNishant\u200c \u200cSingh\u200c",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/01/Nishant-Singh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "nishant.singh@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2019)",
          "IIT Roorkee",
          "MBA (2009)",
          "Madurai Kamaraj University",
          "B.Sc (2006)",
          "C. C. S University Meerut"
        ],
        Experience: [],
        Research: [
          " 1. Meaningful Work ",
          " 2. Innovative work behavior",
          " 3. Mindfulness",
          " 4. Psychological Contract"
        ],
        Projects: [],
        Distinction: [
          "1. UGC NET",
          "2. Member of Indian Society for Training and Development (ISTD) Dehradun chapter"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-%e2%80%8cnishant%e2%80%8c-%e2%80%8csingh%e2%80%8c/"),
    Faculty_model(
        Name: "Dr. Shruti Ashok",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/12/shruti-pic310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "shruti.ashok@bennett.edu.in",
        About:
            "Dr Shruti Ashok is an academician, researcher & a Finance professional with Ph.D. from Faculty of Management Studies, Delhi University and B. Com (Hons) From SRCC, Delhi University.Currently working as an Assistant Professor in Finance with Bennett University, she has over 14 years of experience across academia and corporate. Her Industry engagements spanning 3 years, include HSBC Bank Dubai, Citibank, HDFC Bank and State Bank of India. She is skilled in equity valuation, corporate finance, corporate restructurings and Portfolio management. She has presented her research work at conferences organised by IITs, IIMs and FMS and her scholarly work has been published in reputed international journals. ",
        Education: [
          "  Ph.D. (2019) ",
          "  Faculty of Management Studies, Delhi University ",
          " MBA (2004) ",
          " ICFAI University ",
          " B.Com(H)(2002) ",
          " SRCC,Delhi University "
        ],
        Experience: [
          " Assistant Professor, Bennett University, Greater Noida ",
          " Assistant Professor, Amity University, Noida ",
          " Visiting Lecturer - Amity University, Noida. India ",
          " Visiting Lecturer - Bombay Stock Exchange. ",
          " Assistant Professor, Amity University, Noida ",
          " Corporate Experience across banks like HSBC Bank Dubai, HDFC Bank and Citibank  "
        ],
        Research: [
          "Corporate Finance ",
          "Financial Innovation ",
          "Financial Planning ",
          "Portfolio Management "
        ],
        Projects: [],
        Distinction: [" Awarded JRF Scholarship for Ph.D.  "],
        profile: "https://www.bennett.edu.in/faculties/dr-shruti-ashok/"),
    Faculty_model(
        Name: "Anubhuti Saxena",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/12/Anubhuti-Saxena310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "Anubhuti.Saxena@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D. Pursuing ",
          "Birla Institute of Technology Mesra, Ranchi ",
          " MBA (2011)",
          "Guru Gobind Singh Indraprastha University, Delhi ",
          " B.SC (Hons) Microbiology (2009) ",
          " Delhi University, Delhi "
        ],
        Experience: [
          " Assistant Professor, Jagannath Institute of Management Studies (JIMS), Greater Noida. ",
          " Assistant Professor , Lal Bahadur Shastri Institute of Management & Technology (LBSIMT), Bareilly. ",
          " Assistant Professor , Chander Prabhu Jain College of Higher Studies and School of Law (CPJ-CHS), Delhi. "
        ],
        Research: [
          "Workplace Spirituality ",
          "Deviant Behaviour ",
          "Workplace Ostracism ",
          "Positive Organizational Behaviour "
        ],
        Projects: [],
        Distinction: [
          " National Eligibility Test JRF (NET JRF-2017) in Human Resource Management, Labour Welfare and Industrial Relations ",
          " National Eligibility Test (NET-2011) in Human Resource Management, Labour Welfare and Industrial Relations ",
          " Visiting Faculty at Jaipuria Institute of Management, Noida ",
          " Reviewer of International Journal of Organizational Analysis ",
          " Done Course on Crafting Realities: Work, Happiness and Meaning offered by IIM Bangalore in December, 2019."
        ],
        profile: "https://www.bennett.edu.in/faculties/anubhuti-saxena/"),
    Faculty_model(
        Name: "Dr. Pradeep Kumar Mohanty",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/10/Pradeep-Mohanty310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "Pradeep.mohanty@bennet.edu.in",
        About:
            "Dr. Pradeep Kumar Mohanty has a Ph.D. from Department of Management Studies, Anna University (Chennai). He has done MBA from Utkal University (Bhubaneswar) with dual specialization in Marketing & HR. He is having more than 17 years of work experience. He has served around 15 years in different corporate houses such as Murugappa Group, Paradeep Phosphates Limited (Zuari industries), and DCM Shriram Group for and around 2 years of academic experience. His research areas are Customer Satisfaction and Loyalty, Purchase Intention & Behaviour, Buyer-Seller Relationship & CSR and teaching areas are Brand Management, Sales & Distribution Management, Rural Marketing and Consumer Behavior etc.  ",
        Education: [
          "Ph.D. (2019), Customer Satisfaction & Loyalty",
          " Anna University, Chennai ",
          " MBA,Marketing & HR (2006)",
          " Utkal University, Bhubaneswar ",
          " MSc. Agriculture Zoology & Entomology (1999)",
          " (Agri., DDU Gorakhpur University, Gorakhpur University"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          " Assistant Professor, IMT-Hyderabad",
          " Asst. Manager- Market Development, Paradeep Phosphates Limited",
          " Asst. Manager- Retail Sales & Operation, Hariyali Kisan Bazar (DSCL Group)",
          " Officer-Market Development, Paradeep Phosphates Limited",
          " Marketing Representative, E.I.D Parry (Murugappa Group)"
        ],
        Research: [
          "Customer Satisfaction & Loyalty",
          "Purchase Intention & Behavior",
          "Buyer-Seller relationship",
          " CSR "
        ],
        Projects: [],
        Distinction: [],
        profile:
            "https://www.bennett.edu.in/faculties/dr-pradeep-kumar-mohanty/"),
    Faculty_model(
        Name: "Dr. Sumit Mishra",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/07/sumit-Mishra310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "Marketing Management",
        Position: "null",
        Email: "sumit.mishra@bennett.edu.in",
        About:
            "Sumit Mishra has a PhD (Marketing & Strategy) from Department of Management Studies, IIT Roorkee in 2019. He got an MBA degree (Marketing and Finance) in 2013 and a B.Tech degree (Electrical and Electronics Engineering) in 2010 and has presented papers at various seminars and conferences. He has published papers indexed in Scopus, Social Science Citation Index with the focus on qualitative research methodologies, ancient perspective, and cultural aspects. ",
        Education: [
          "Ph.D. (2019), Marketing & Strategy ",
          " Indian Institute of Technology Roorkee ",
          " M.B.A. (2013), Marketing & Finance ",
          " Motilal Nehru Institute of Technology, Allahabad",
          "B.Tech (2010), Electrical & Electronics",
          "UP Technical University, Lucknow "
        ],
        Experience: [],
        Research: [
          " Social Marketing ",
          " Values",
          " Social Change  ",
          " Social Innovation "
        ],
        Projects: [],
        Distinction: [
          " Qualified GATE (2010) in Electrical Engineering. ",
          "Recipient of Research Fellowship by University Grant Commission for five years (Jan 2014- Dec 2018).",
          "Finalist of GE Edison Challenge 2014 among 245 participants conducted by General Electric, USA at John F Welch Technology Centre, Bengaluru during January 2015 and received prize worth Rs 50,000.",
          "Recipient of 150 award for contribution in Crescendo- Emerald Publishing in May, 2017.",
          " Second Prize in Business plan contest, B- Ception held at Parivartan 2015 IIT Delhi on20-21 Feb 2015."
        ],
        profile: "https://www.bennett.edu.in/faculties/sumit-mishra/"),
    Faculty_model(
      Name: "Dr. Anjali Malik",
      Image:
          "https://www.bennett.edu.in/wp-content/uploads/2019/08/anjali-malik_310x310.png",
      Designation: "Professor",
      School: "School of Management",
      Department: "null",
      Position: "null",
      Email: "Anjali.malik@bennett.edu.in",
      About:
          "Anjali Maliks research focuses on consumer behaviour. The specific areas of her research contribution have explored technology acceptance/adoption behaviour among consumers, online gaming consumption among adolescents, and also marketing and consumption activities among bottom-of-pyramid consumers. Her work has been published in category ranked journals like South Asian Journal of Management, International Journal of Electronic Business, International Journal of Business and Emerging Markets, Journals of IIM-L, Journal of Indian Culture and Business, and others. Methods used include phenomenology, descriptive approach, in-depth interviews, and focus groups. Her writing is also published in the form of cases and articles in various outlets. Her Doctoral training from University Business School, Chandigarh, was in the field of Marketing, specializing in Consumer Behaviour. She has a total of nineteen years of teaching, training, consulting and industry experience. Prior, to joining Bennett University, she was a Professor of Marketing with S.P. Jain Institute of Management & Research, Mumbai. She also has a teaching experience with IILM, Gurgaon and Lal Bahadur Shastri Institute of Management & Research, Delhi along with couple of years spent with Industry in the sales and marketing function. Her teaching interests include, Marketing Strategy, Marketing Research, Customer Relationship Management, Consumer Behaviour, and Rural Marketing.",
      Education: [
        " PhD (2005), Marketing ",
        " University Business School, Panjab University, Chandigarh",
        " PGDM (1999), Marketing ",
        "Institute of Productivity &amp; Management, Meerut",
        "BSc. Agriculture & AH (1997), Agronomy",
        "G.B. Pant University of Agriculture &amp; Technology, Pantnagar"
      ],
      Experience: [
        "Professor , Bennett University",
        "Professor, S. P. Jain Institute of Management & Research, Mumbai ",
        " Associate ProfessorIILM, Gurgaon",
        " Assistant Professor, Lal Bahadur Shastri Institute of Management & Research, Delhi ",
        " Research Scholar, UBS, Chandigarh ",
        " Business Development, Alert Management Services ",
        " Wingreens Farms: Sustainable Growth, Published at Richard Ivey and listed at HBSP. Product #: W17794-PDF-ENG . Publication Date:  Dec 18, 2017.  "
      ],
      Research: [
        "1. Online gaming consumption among adolescents ",
        "2. Technology acceptance/ adoption models ",
        "3. Marketing and consumption activities at the bottom-of-pyramid "
      ],
      Projects: [
        "Pathological gaming habits among adolescents in India, project sponsored by SPJIMR, Mumbai.",
        "Degree of Multinationality and Financial Performance of Indian Textile Sector  Research sponsored by LBSIM, Delhi.",
        "Liberalization of Fertilizer Industry and its impact on the Indian Agriculture - A Critical Study  Aim was to analyze the long- term fertilizer policy of Government of India with respect to liberalization measures for the growth and development of Fertilizer Sector in India and to suggest appropriate measures for future policy formulation to ensure India's growth and self- sufficiency in food production."
      ],
      Distinction: [
        " Certified Peer Reviewer for (SAQS) South Asian Quality Standards, Certified by AMDISA (Association of Management Development Schools in South Asia), Hyderabad",
        " Spearheaded AACSB and other accreditations to successful completion and award of Accreditations for SPJIMR, Mumbai and IILM, Delhi. ",
        " Consulting assignment on A Study on Customer Satisfaction Index for PEC Limited, a public enterprise based at New Delhi under Department of Commerce, Ministry of Commerce and Industry, Government of India. ",
        " Conducted several training programmes in customer relationship management, integrated marketing communication, marketing strategy for clients like CII, Gurgaon, PHDCCI, Delhi, EIL, Delhi etc.",
        " Shriram Awards -Best Paper for Doctoral work on Post subsidy removal fertilizer consumption: A study of farmer perspective. The Fertilizer Association of India (FAI), Ministry of Agriculture, Government of India, New Delhi, India, in September 2004.",
        " Selected for Public Service Commission, UP in 2004.",
        " Selected for scholarship of Women Scientist in IPR issues by TIFAC, Dept of Science and Tech, GOI in 2003."
      ],
      profile: "https://www.bennett.edu.in/faculties/anjali-malik/",
    ),
    Faculty_model(
        Name: "Dr. Rajib Sarkar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/08_Dr.-Rajib-Sarkar-Assistant-Professor-Financial-Management.jpg",
        Designation: "MBA Program",
        School: "School of Management",
        Department: "Finance Management",
        Position: "null",
        Email: "rajib.sarkar@bennett.edu.in",
        About:
            "Rajib Sarkar is an alumnus of Melbourne Business School, XLRI Jamshedpur and NIT Bhopal. He has close to two decades ofcorporate experience, spanning several industries viz. automobiles, media, energy and management consulting. His last corporate role was that of a Vice-President in a management consulting firm in Washington D.C. As a management consultant, he has served a number of companies (including global Fortune 500 companies) in both North America and Europe. He has attended several business and academic conferences/seminars in the US, China, France and Italy. Sarkar teaches finance subjects. His believes in demystifying finance and reclaiming the easy elegance of its powerful concepts for students. His approach of teaching finance is to relate it to other functional areas of business and bringing to life the underlying theories of finance by invoking examples from the real world, often drawn from his personal work experience.  His teaching philosophy is to harness the power of finance for the greater good, creating value for the society at large, going much beyond a set of techniques of managing risks and returns of portfolios. Sarkars research interests include commodity derivatives, price discovery and equity asset valuation.",
        Education: [
          "B.E",
          " NIT Bhopal ",
          "PGPM XIM",
          "Bhubaneswar",
          "PDM",
          " Melbourne Business School",
          "Ph.D.",
          "XLRI Jamshedpur"
        ],
        Experience: [
          " Bennett University Asst. Professor Greater Noida",
          "Guizzetti & Associates Vice-President Washington D.C.",
          "CHR Global Associate Vice-President Mumbai",
          "Enercon India Asst. General Manager Mumbai"
        ],
        Research: [
          "1.Commodity Derivatives",
          "2. Price Discovery",
          "3.Volatility Spillover"
        ],
        Projects: [
          "1. Impact of tariff regime shifts on information transmission in Indian commodity derivative markets."
        ],
        Distinction: [
          "Represented India at the World Citizens Assembly held at Lille, in France",
          "Represented India as a member of an international delegation to Beijing, Shanghai, Shenzhen and Jilin",
          "Participated in Inter-American Development Banks conference on Financing of Private and Public Sector Infrastructure Projects, in Washington D.C., USA",
          " Participated IIM Calcuttas Summer School on Empirical Finance",
          "Participated in IIM Indores Summer School on Quantitative Finance"
        ],
        profile: "https://www.bennett.edu.in/faculties/rajib-sarkar/"),
    Faculty_model(
        Name: "Dr. Deepika Dhingra",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/06_Dr.-Deepika-Dhingra-Assistant-Professor-Finance-3.jpg",
        Designation: "Associate Professor",
        School: "School of Management",
        Department: "Finance Management",
        Position: "null",
        Email: "Deepika.dhingra@bennett.edu.in",
        About: "                ",
        Education: [
          "Ph.D. (2014)",
          "Corporate Finance , Faculty of Management Studies, Delhi University ",
          "M.B.A (2005)",
          "Guru Gobind Singh Indraprastha University",
          "B.C.A (2002)",
          "Guru Gobind Singh Indraprastha University "
        ],
        Experience: [
          "Associate Professor at Bennett University",
          "Associate Professor & Area Chair IILM Institute of Higher Education ",
          "Assistant Professor, Jagannath Institute of Management Sciences ",
          "Assistant Manager Axis Bank Limited"
        ],
        Research: [
          "Empirical Corporate Finance ",
          "Corporate Restructuring",
          "Financial Innovation"
        ],
        Projects: [],
        Distinction: [
          " Awarded UGC Non-NET scholarship for Ph.D",
          "Have conducted training sessions for PSU's.",
          "Have done consulting assignments for Broomberg, crazycrafts etc"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-deepika-dhingra/"),
    Faculty_model(
        Name: "Dr. Nidhi Sinha",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/nidhi-jpg-1.png",
        Designation: "Chair, BBA Program",
        School: "School of Management",
        Department: "Marketing Management",
        Position: "null",
        Email: "nidhi.sinha@bennett.edu.in",
        About:
            "Dr. Nidhi Sinha has more than 16 years of rich experience in teaching, research and training. She is Associate Professor of Marketing and Communication in School of Management at Bennett University. She specializes in the areas of Brand Management, Marketing communication, Internet and Digital Marketing and Social media marketing. Her current research focuses on branding in the digital domains, use of online and social media in todays world of marketing. As an educator she aims to inspire, empower and encourage students to produce authentic, innovative and socially conscious research outcomes in the domain of marketing. To her credit she has several research papers in the various refereed International and National Journals and has presented research papers at diverse National and International forums. She has also been awarded with diverse prestigious Best Paper awards for her work. Prior to joining Bennett University, she has worked for 11 years with Jaypee Institute of Information Technology, Noida and also with Corporates like Educomp Solutions, BPCL and Subsidiaries of Mahindra Group at managerial levels. ",
        Education: [
          "PhD (2012)",
          " Management (Marketing), Jaypee Institute of Information Technology, Noida ",
          "B.Ed (2005)",
          "Management, Dayalbagh Educational Institute (DEI, Deemed University), Agra ",
          "MBM(Masters of Business Management) (2002) ",
          "Management, Dayalbagh Educational Institute (DEI, Deemed University), Agra",
          "BBM (Hons) (Bachelor of Business Management) (2001)",
          "BBM (Hons)-Finance &amp; BBM- Management, Dayalbagh Educational Institute (DEI, Deemed University), Agra"
        ],
        Experience: [
          "Associate Professor Bennett University School of Management ",
          "Assistant Professor (Senior Grade) Jaypee Institute of Information Technology, Noida ",
          "Manager Marketing,Educomp Solutions Pvt. Ltd.",
          "Sales Manager, Club Mahindra Holidays (100% Subsidiary of Mahindra Group) ",
          "Management Trainee (Executive), Bharat Petroleum Corporation Ltd."
        ],
        Research: [
          "1. Branding, Corporate Branding, Marketing, Internet and Digital Marketing",
          "2.Knowledge Management",
          "3.Training and Development, Education",
          "5.Human Resource Management"
        ],
        Projects: [],
        Distinction: [
          "2005 Bachelors of Education with Merit and Distinction.",
          "Certified Train The Trainer and a DISC certified trainer.",
          "Recipient of Special Jury Award for the Best Thesis in Management by 3E Innovation Foundation, June 2015.",
          "Awarded the First prize for the Best Paper Award in various International and National Conferences."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-nidhi-sinha/"),
    Faculty_model(
        Name: "Dr. Sudha Jha Pathak",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/08/Dr-Sudha-PathakB.png",
        Designation: "Assistant Professor (History)",
        School: "School of Law",
        Department: "null",
        Position: "null",
        Email: "sudha.pathak@bennett.edu.in",
        About: "",
        Education: [
          "Ph.D.",
          "GSLET JRF (ICHR), M. S. University of Baroda, Vadodara",
          "M.A.",
          "Jadavpur University, Kolkata (2nd rank in University)",
          "B.A.(Hons.)",
          "Jadavpur University, Kolkata (2nd rank in University)"
        ],
        Experience: [],
        Research: [
          "Ancient Indian History",
          "Legal History",
          "Women and related issues"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-sudha-jha-pathak/"),
    Faculty_model(
        Name: "Dr. Shamindra Nath Sanyal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/11/Dr-Shamindra-Nath-Sanyal310x310.png",
        Designation: "Associate Professor",
        School: "School of Management",
        Department: "Marketing Management",
        Position: "null",
        Email: "shamindra.sanyal@bennett.edu.in",
        About: "  ",
        Education: [
          "PhD (2015)",
          "Business Management, University of Calcutta",
          "MBA (2007)",
          "Marketing Management, Indira Gandhi National Open University",
          "M.Sc.(1997)",
          "Physical Chemistry, University of Kalyani"
        ],
        Experience: [
          "Associate Professor Marketing, Bennett University",
          "Associate Professor-Marketing & Member-Research Cell, Globsyn Business School, Kolkata",
          "Professor-Marketing & Head, Department of Business Management, Institute of Engineering & Management, Kolkata",
          " Assistant Professor-Marketing, Institute of Engineering & Management, Kolkata",
          "Associate Professor & Academic Coordinator, Future Innoversity, Kolkata",
          "Lecturer-Marketing, Narula Institute of Technology, Kolkata",
          "Regional Business Manager, Eskag Pharma Pvt. Ltd.",
          "Area Business Manager, Alkem Laboratories Ltd. (Pentacare Division)",
          "Area Manager, Raptakos, Brett & Co. Ltd.",
          "Marketing Executive, German Remedies Ltd. (Respicare Division)",
          "Medical Representative, Raptakos, Brett & Co. Ltd."
        ],
        Research: [
          " 1. Brand Management (especially related to Pharmaceuticals, Luxury Brands and Retail)",
          " 2. Consumer Behaviour (related to consumer motivation and attitude)",
          " 3. Marketing Innovation and online marketing",
          "4. Cross-cultural Marketing and its impact on brand usage"
        ],
        Projects: [],
        Distinction: [
          "Received the AMP Academic Excellence Award, 2019, conceived by Academy of Management Professionals, India and supported by IDMBA, Hyderabad, India as the \"Best Professor in Marketing Management\".",
          "Ranked 8th in 19th CEEMAN-Emerald Case Writing Competition, 2013.",
          "Research paper published in Journal of Product and Brand Management has been selected as a course literature in the Course of Brand Management at Masters Level in Roskilde University, Denmark."
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-shamindra-nath-sanyal/"),
    Faculty_model(
        Name: "Sumita Vaid",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/03/sumitaVaid310x310-1.png",
        Designation: "Assistant Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "sumita.vaid@bennett.edu.in",
        About:
            "Sumita Vaid has 12 years experience in online journalism and has written extensively on advertising and media during her stints with online advertising and media news portal afaqs!, Outlook Business magazine, the DNA newspaper and monthly education magazine Careers360.",
        Education: [
          "MA Creative Writing ",
          "Bath Spa University, Bath, United Kingdom",
          "MA English Literature",
          "MA English Literature Miranda House, Delhi University",
          "BA English Literature",
          "Miranda House, Delhi University"
        ],
        Experience: [],
        Research: [
          "Masters thesis on literary fiction ",
          "Literary fiction titled Breaking Away nearing completion."
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/sumita-vaid/"),
    Faculty_model(
        Name: "Dr. Palakh Jain",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/05_Dr.-Palakh-Jain-Assistant-Professor-Economics.jpg",
        Designation: "Associate Professor",
        School: "School of Management",
        Department: "Economics Management",
        Position: "null",
        Email: "palakh.jain@bennett.edu.in",
        About:
            "Dr. Palakh Jain is an Associate Professor in the School of Management at Bennett University. A Fellow of IIM- Ahmedabad in Economics area and alumni of Delhi School of Economics, University of Delhi, Palakh was awarded Junior Research Fellowship by the UGC in 2005. Recently, she was associated as a Consultant with ICRIER leading a project on Indo-Pak FDI. In past, Palakh had been associated with constituent colleges of Delhi University as an Assistant Professor of Economics. Her research interests include Outward FDI and Emerging Market MNCs. She has recently co-authored a book titled 'Outward FDI-Why, Where and How?-The Indian Experience'. She was selected as Resident Writer at Sanskriti Foundation while working on her book.",
        Education: [
          "FPM(Economics) 2013",
          " IIM-Ahmedabad",
          "M.A. (Economics) 2005 ",
          "Delhi School of Economics ",
          "B.A.(Economics) (Hons) 2003",
          "Kirori Mal College, University of Delhi"
        ],
        Experience: [
          "Associate Professor at Bennett University, India ",
          "Advisory Board Member, Discourse Analytica",
          "Subject Matter Expert, Delhi Skills and Entrepreneurship University",
          "Assistant Professor at Bennett University, India ",
          "Research Assistant, NITI Aayog",
          "Senior Fellow, PahleIndia Foundation",
          "Associate Professor  Delhi School of Business",
          "Economic Advisor, DFID, British High Commission",
          "Fellow, Indian Institute of Management  Ahmedabad",
          "Research Assistant to Padma Bhushan Dr. Isher Judge Ahluwalia",
          "Assistant Professor  Hansraj College, University of Delhi",
          "Visiting Faculty at MDI Gurgaon, IMT Ghaziabad, Faculty of Management Studies, Shiv Nadar University, FORE School of Management"
        ],
        Research: ["1. Outward FDI", "2. Internationalisation of MNCs"],
        Projects: [],
        Distinction: [
          "Awarded Junior Research Fellowship (JRF) by UGC (2005)",
          "Awarded full Scholarship at IIM-Ahmedabad for six years"
        ],
        profile: "https://www.bennett.edu.in/faculties/palakh-jain/"),
    Faculty_model(
        Name: "Dr. Sangeeta Shukla",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/15_Dr.-Sangeeta-Shukla-Associate-Professor-Business-Communication.jpg",
        Designation: "Professor & MBA Chair",
        School: "School of Management",
        Department: "Business Communication Management",
        Position: "Members (Academic Council)",
        Email: "sangeeta.shukla@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2014)",
          " English Literature, SGBAU, Amravati ",
          "English ",
          "M.A.",
          "English Literature"
        ],
        Experience: [
          " Bennett University : Professor Business Communication ",
          "Indian Institute of Management, Lucknow : Associate Professor Business Communication",
          "Birla Institute of Management , Gr. Noida : Associate Professor Business Communication"
        ],
        Research: [
          "1. Managerial Communication",
          "2. Intercultural Communication",
          "3. Leadership Communication",
          "4. Gender and Communication Styles",
          "5 Corporate Communication"
        ],
        Projects: [],
        Distinction: [
          "Thomas International Certification -Personal Profile Analysis (PPA-Thomas Profiling.19-20 May, 2015",
          "IT Delhi- Continuing education Programme on-Experimental and Empirical Methods in Linguistics, July2017",
          "onducted over 100 MDP training sessions in the past 5 years for organizations such as: Goldman Sachs, Pearson, NTPC, Powergrid, NSPCL, GAIL, IFFCO, NHPC, Expressions India, Oriental Insurance, IRS officers, HAL, Lafarge Cement etc"
        ],
        profile: "https://www.bennett.edu.in/faculties/sangeeta-shukla/"),
    Faculty_model(
        Name: "Malvika Kaul",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/05/Malvika-Kaul-Bennett-22.png",
        Designation: "Associate Professor",
        School: "Times School of Media",
        Department: "null",
        Position: "null",
        Email: "Malvika.kaul@bennett.edu.in",
        About:
            "Malvika Kaul has reported and edited for Indias top newspapers and news agencies for over two decades, besides being one of the youngest chief reporters of a Delhi newspaper. Her experience as a crime reporter, health, education and aviation correspondent, and her stories on social issues have equipped her to tell stories through multiple lenses. As an editor, she has developed an eye for the essential and urgent news.Since 2013, Malvika has taught courses on news writing, investigative journalism and media ethics. A post graduate in History from Delhi University, Malvika is pursuing her PhD on news frames for conflict reportage.Malvika won the Panos South Asia Media Fellowship (London) in 2003 for writing on women empowerment and ICTs.Malvika has been writing a blog on art and culture since 2016. Visit  ",
        Education: [
          "Pursuing Ph.D. Journalism and Mass Communication (2018)",
          "IIS University, Jaipur",
          "MA History (1989)",
          "University of Delhi ",
          "BA History (1987)",
          "Lady Shri Ram College, University of Delhi "
        ],
        Experience: [
          " Associate Professor, Apeejay Stya University, Sohna-Gurgaon",
          "Editor, Eternal Ganges Publications, New Delhi",
          "Director, Writeshop Infotech Pvt. Ltd, New Delhi",
          "Senior Editor, Womens Feature Service",
          "Senior Feature Writer, Times of India",
          "Chief Reporter , The Pioneer"
        ],
        Research: [
          "News Reporting from the Conflict Zone",
          "Framing the news  ",
          "Migrant cultures",
          "Self-censorship, censorship and safety of journalists"
        ],
        Projects: [
          "Research Project on Weekly Markets, Food and Migrant Culture, New Delhi, 2018 onwards",
          "Research Project on Media and Governance, Plan International, New Delhi, 2006",
          "Community Radio Communication Project for Plan International, New Delhi, 2007",
          "Communication Project on Stories of Rebuilding Lives after Gujarat Earthquake, for American India Foundation and University of Melbourne, 2005"
        ],
        Distinction: [
          "Minty  The Dog with Many Tales, a childrens book, shortlisted by National Book Trust for the Beijing International Book Fair, 2014",
          "Won the Panos South Asia Media Fellowship, London, 2003, for writing on women empowerment and ICTs"
        ],
        profile: "https://www.bennett.edu.in/faculties/malvika-kaul/"),
    Faculty_model(
        Name: "Dr. Koyal Verma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/11/Koyal-Verma310x310.png",
        Designation: "Assistant Professor",
        School: "School of Management",
        Department: "null",
        Position: "null",
        Email: "Koyal.verma@bennett.edu.in",
        About:
            "Dr. Koyal Verma is currently an Assistant Professor at the School of  Management and Liberal Arts at Bennett University. She was teaching at Miranda House,  Delhi University and Ambedkar University Delhi previously She has taught sociology at Delhi  University for 5 years and has taught at Hindu College and Maitreyi College. She has taught  courses on urban sociology, social stratification, and sociology of gender. At Ambedkar  University she taught the post-graduate students a course of Urban Development and  Environment which she developed and designed. She has co-supervised students for their MA  dissertations in the School of Human Ecology, Ambedkar University Delhi. She also worked  with UNESCO on a gender and media project titled Media Action Against Rape. She has  been associated with several UN projects including those on tribal arts and indigenous  handicrafts in India. She has worked on research projects for Jawaharlal Nehru University and  FORD Foundation. She has been actively working on urban issues. She has also worked on a  Yale University project on urban environment and governance. Her specialization is in the  areas of urban sociology, migration, race, ethnicity and diaspora Studies.",
        Education: [
          "Ph.D. Awarded (2018)",
          "Jawaharlal Nehru University",
          "M. Phil in Sociology (2014)",
          "Jawaharlal Nehru University",
          "M.A. in Sociology (2010)",
          "Jawaharlal Nehru University",
          "M.A. in Sociology (2008)",
          "Panjab University",
          "B.A. Honours in Psychology (2006)",
          "Govt. College for Girls, Sector- 11, Chandigarh."
        ],
        Experience: [
          "Assistant Professor, Department of School of Liberal Arts, Bennett University, Greater Noida, India",
          "Assistant Professor, School of Human Ecology, Ambedkar University Delhi",
          "Assistant Professor, Miranda House, Delhi University.",
          "Assistant Professor, Maitreyi College, Delhi University.",
          "Assistant Professor, Hindu College Delhi University.",
          "Teaching Assistant, Centre for the Study of Social System. Jawaharlal Nehru University."
        ],
        Research: [
          "URBAN STUDIES",
          "AFRICAN STUDIES",
          "MIGRATION STUDIES",
          "RACE AND ETHNICITY",
          "DIASPORA STUDIES",
          "GENDER"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-koyal-verma/"),
    Faculty_model(
        Name: "Dr. Souradyuti Ghosh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/44_Dr.-Souradyuti-Ghosh-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Chemistry",
        Position: "null",
        Email: "souradyuti.ghosh@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2015)",
          "Chemistry, Johns Hopkins University, USA ",
          "MS (2008)",
          "Chemistry Indian Institute of Technology (IIT), Madras ",
          "BSc (Hons) (2006)",
          "Chemistry, University of Calcutta "
        ],
        Experience: [
          "Associate Professor - Bennett University School of Engineering & Applied Sciences",
          "Postdoctoral Researcher, Department of Chemistry and Chemical Biology, Cornell University",
          "Doctoral Student - Johns Hopkins University, USA",
          "MS research scholar- Indian Institute of Technology Madras, Chennai"
        ],
        Research: [
          " 1. Use of functional DNA ",
          " in AMR pathogen detection",
          "2. Use of functional DNA sensors in pore based detection",
          "3. Use of functional DNA sensors in "
        ],
        Projects: [
          "1. Investigating electrophilic signalling in Caenorhabditis elegans and Escherichia coli (postdoc work with Prof Yimon Aye, Cornell University), 2015-16 (1 review article and 1 paper in preparation)",
          "2. Investigating the chemical nature of DNA damage through their stable analogues (doctoral work with Prof Marc M Greenberg, Johns Hopkins University), 2009-15 (4 papers)",
          "3. 29Si NMR-transition selective double quantum filter experiments in one and two dimensions (MS thesis work with Prof N Chandrakumar, IIT Madras), 2007-08 (1 book chapter)"
        ],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-souradyuti-ghosh/"),
    Faculty_model(
        Name: "Priyadharshini. B",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/09/Priyadharshini.-B-1.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Civil Engineering",
        Position: "null",
        Email: "Priyadharshini.b@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D.(2019), Atmospheric Aerosols and Climate Change",
          " Indian Institute of Technology Kharagpur ",
          " M.Tech (2012), Environmental Engineering and Management",
          " Pondicherry University, Pondicherry ",
          " B.Tech (2009), Energy and Environmental Engineering ",
          " Tamil Nadu Agricultural University, Coimbatore, Tamil Nadu "
        ],
        Experience: [
          " Assistant Professor, Bennett University ",
          "Teaching Assistant, Indian Institute of Technology Kharagpur "
        ],
        Research: [
          "Aerosol instrumentation ",
          " Aerosol physical and chemical properties ",
          " Aerosol monitoring and characterization ",
          " Aerosol and its health impacts "
        ],
        Projects: [],
        Distinction: [
          " Awarded Ministry of Human Resource Development fellowship (2012-2017).",
          "Postgraduate Scholarship (2010-2012).",
          "AEE International Student Scholarship by Association of Energy Engineers, USA (2008)."
        ],
        profile: "https://www.bennett.edu.in/faculties/priyadharshini-b/"),
    Faculty_model(
        Name: "Dr. Manu Smriti Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/04/manuSmritiSingh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "manu.singh@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2014)",
          "Pharmaceutical Technology, University of Bonn, Germany",
          "M.Sc. Biotechnology (2008)",
          "Biotechnology, Pondicherry University, India",
          "B.Sc. (2005)",
          "Biology, Allahabad University, India"
        ],
        Experience: [
          "Department of Biochemistry and Molecular Biology, Hadassah Medical School Hebrew University of Jerusalem ",
          "Centre of Nanotechnology & Nanoscience, Department of Cell Research and Immunology, Tel-Aviv University, Israel",
          "Product Development Cell-I, National Institute of Immunology (NII), New Delhi, India."
        ],
        Research: ["Cancer Nanomedicine", "Tumor microenvironment"],
        Projects: [],
        Distinction: [
          "Travel Fellowship for Visiting Fellow to OncoRay- Center for Radiation Research in Oncology, Faculty of Medicine, Technische Universitaet- Dresden, Germany",
          "Rivkin Foundation Grant on Ovarian Cancer Research",
          "Research Grant from Mark & Susan Mark Program in Ovarian Cancer",
          "Ph.D. Fellowship awarded by NRW International Graduate School of BIOTECH-PHARMA at Universit\u00e4t Bonn, Germany",
          "Recipient of DBT Fellowship during M.Sc. in Biotechnology at Pondicherry University."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-manu-smriti-singh/"),
    Faculty_model(
        Name: "Dr. Sarika Chaudhary",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/04/Sarikla-Chaudhary-Bennett-University.png",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "sarika.chaudhary@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2013) Biotechnology",
          " Banasthali University, Rajasthan &amp; University of California, San Francisco, USA",
          " M. Sc. (2000) Botany",
          "Institute Of Advanced Studies, CCSU, Meerut",
          " B. Sc. (1997) Biology",
          " RGPG College, CCSU, Meerut"
        ],
        Experience: [
          " Associate Professorat Bennett University ",
          " Staff ScientistSt. Jude Childrens Research Hospital, Memphis, USA",
          " Ramanujan Fellow at CSIR- IGIB, New Delhi, India",
          " Post doctoral fellow at University of California San Francisco, USA",
          " Staff Research Associate at University of California San Francisco, USA",
          " Staff Research Associate at University of California Berkeley, USA",
          " Research Assistant and Lab manager at University of Central Florida, Orlando, USA",
          " Research Assistant and Lab manager at University of Virginia Medical Center"
        ],
        Research: [
          "Understanding the mechanistic aspects of disease pathogenesis by performing structural, biochemical and biophysical investigations  "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-sarika-chaudhary/"),
    Faculty_model(
        Name: "Dr. Deepa Khare",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/04/deepKhare310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "deepa.khare@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2017)",
          "Plant Molecular Biology, POSTECH, South Korea",
          "M. Sc. (2005)",
          "Plant Biotechnology, C.C.S.U., Meerut",
          "B. Sc. (2003)",
          "Biology, C.C.S.U., Meerut"
        ],
        Experience: [
          "Assistant Professor, Biotechnology, Bennett University, Greater Noida",
          "Post-Doctoral Fellow, POSTECH, South Korea ",
          "Researcher, POSTECH, South Korea ",
          "Researcher, POSTECH, South Korea ",
          "Researcher, C.C.S.U., Meerut "
        ],
        Research: [
          " 1. Plant-pathogen interaction ",
          " 2. Plant root avoidance to heavy metals"
        ],
        Projects: [],
        Distinction: [
          " Young scientist award by BRIC, National Research Foundation of Korea, 2017.",
          " Graduate Student Research Recognition award, selected for excellent research abstract by a graduate student, in 25th ICAR, 2014, Vancouver Canada ",
          " Received University Research Scholarship for year 2007-2008 for attaining highest marks in M.Sc. (C.C.S.U., India) ",
          " Gold medallist of M.Sc., 2005. ",
          " Scholarship from Shri Gyan Prakash Mittal Memorial Trust, Meerut for attaining highest marks B.Sc., 2003. ",
          " Scholarship from Pandit Pyare Lal Sharma Memorial Trust, Meerut for attaining highest marks B.Sc., 2003 "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-deepa-khare/"),
    Faculty_model(
        Name: "Dr. Mrittika Sengupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/38_Dr.-Mrittika-Sengupta-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "mrittika.sengupta@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2011)",
          " Cell and Molecular Biology, Illinois State University, USA ",
          "(2004)",
          "Microbiology, Bangalore University, India",
          "B. ",
          ". (2002)",
          "Microbiology, Bangalore University, India"
        ],
        Experience: [
          "Associate Professor Bennett University Department of Biotechnology ",
          "Department of Biotechnology Research Associate Regional Centre for Biotechnology Faridabad, Haryana",
          "Assistant Professor Uka Tarsadia University, Surat, Gujarat",
          "Postdoctoral Research Associate University of Miami, USA ",
          "Adjunct Assistant Professor Illinois Wesleyan University USA"
        ],
        Research: [],
        Projects: [],
        Distinction: [
          "2010, 2009, 2008 - Awarded the Weigel Research Grant",
          "2011 - Awarded the Omar Rilett Travel Scholarship"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-mrittika-sengupta/"),
    Faculty_model(
        Name: "Dr. Gopinath Sahoo",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/01/Gopinath310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mathematics",
        Position: "null",
        Email: "gopinath.sahoo@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D. (2018), Mathematics ",
          " IIT Bhubaneswar, Odisha, India",
          "M.Sc. (2010), Mathematics ",
          " Utkal University, Vani Vihar, Bhubaneswar, Odisha, India",
          "B.Sc.(2006), Mathematics ",
          " Buxi Jagabandhu Bidyadhar Autonomous College, Bhubaneswar, Odisha, India"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Post Doctoral Fellow, ISI Delhi, India",
          " National Post Doctoral Fellow, ISI Delhi, India"
        ],
        Research: ["Spectral Graph Theory ", " Combinatorial Matrix Theory "],
        Projects: [
          "March 2019  August 2020, Complex adjacency spectra of (multi)digraphs and properties of tournaments, SERB Govt. of India."
        ],
        Distinction: [
          "NBHM (National Board of Higher Mathematics)  Post Doctoral Fellowship, 2018.",
          " Got NPDF (SERB, Govt. of India) Post Doctoral Fellowship, 2019.",
          "Qualified CSIR-NET (National Eligibility Test), June 2012. ",
          " Got PG Merits Scholarship, DST Odisha, India; 2008.  "
        ],
        profile: "https://www.bennett.edu.in/faculties/gopinath-sahoo/"),
    Faculty_model(
        Name: "Dr. Saurabh Jyoti Sarma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/39_Dr.-Saurabh-Jyoti-Sarma-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "saurabh.sarma@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2014)",
          "Biotechnology, Universitedu Qubec/ Institute National de la Recherche Scientifique (INRS), Canada",
          "M.Sc. (2007)",
          "Industrial Biotechnology, Berhampur University, India",
          "B.Sc (2005)",
          "Biology, Gauhati University, India"
        ],
        Experience: [
          "Associate Professor Bennett University Department of Biotechnology, School of Engineering & Applied Sciences ",
          "Postdoctoral Scholar University of Calgary ",
          "Research Associate Institut National de la Recherche Scientifique (INRS) Canada",
          "Junior Research Fellow (JRF) Indian Institute of Technology Guwahati "
        ],
        Research: [
          "1. Bioenergy (Biodiesel, Bioethanol, Biobutanol, Biohydrogen and Biogas)",
          "2. Biorefinary and Bioconversion of Waste Biomass",
          "3. Wastewater Treatment and Aerobic Granulation Technology"
        ],
        Projects: [],
        Distinction: [
          "2017- Editor, Microbial Sensing in Fermentation.",
          "2016 - Associate Editor, Nanotechnology for Environmental Engineering.",
          "2016 - Guest Editor, Biofuels.",
          " 2015- Editor, Platform Chemical Biorefinery Future Green Industry"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-saurabh-jyoti-sarma/"),
    Faculty_model(
        Name: "Dr. NAJNIN ISLAM",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/04/Najnin310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mathematics",
        Position: "null",
        Email: "najnin.islam@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2014-2020) Mathematics",
          "IIT Kharagpur, India.",
          "M.Sc. (2014) Mathematics",
          "IIT Kharagpur, India.",
          "B.Sc. (2012) Mathematics",
          "Visva-Bharati University, West Bengal, India"
        ],
        Experience: [
          "Assistant Professor, Bennett University",
          "Teaching Assistant, IIT Kharagpur"
        ],
        Research: [
          "Mathematical modelling on water waves phenomenon",
          "Integral Equations",
          "Numerical Methods",
          "Hydroelasticity and problems related with water waves"
        ],
        Projects: [],
        Distinction: [
          "Awarded Women Post Doctoral Fellowship (September 2020) from IIT Madras.",
          "Awarded Institute Research Assistantship (June 2014-June 2019) funded by MHRD, Govt. of India, from IIT Kharagpur.",
          "Qualified Joint Admission Test for M.Sc. (JAM) 2012 exam in Mathematics"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-najnin-islam/"),
    Faculty_model(
        Name: "Dr. Neelam Choudhary",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/32_Dr.-Neelam-Choudhary-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mathematics",
        Position: "null",
        Email: "neelam.choudhary@bennett.edu.in",
        About:
            "Dr. Neelam Choudhary is Ph.D in Mathematics from IIT Guwahati, M.Sc. in Applied Mathematics from Mahatama Jyotiba Phule Rohilkhand University Campus, Bareilly and B.Sc. from Jagdish Saran Hindu College, Amroha, J. P. Nagar. Her research interests include Fluid dynamics, Numerical analysis, Mathematical Modeling. ",
        Education: [
          "PhD (2015)",
          "Indian Institute of Technology (IIT) Guwahati - Mathematics ",
          "M.Sc.(2008)",
          "M. J. P. Rohilkhand University Campus Bareilly - Applied Mathematics ",
          "B.Sc.(2006)",
          "M. J. P. Rohilkhand University Bareilly - Mathematics "
        ],
        Experience: [
          "Associate Professor at Bennett University, India",
          "Assistant Professor - Department of Mathematics, School of Engineering & Applied Sciences, Bennett University June, 2016 Present",
          "Teaching Assistant - Department of Mathematics, Indian Institute of Technology (IIT) Guwahati 2011-2014"
        ],
        Research: [" 1.Sloshing Dynamics", " 2.Water Wave Mechanics"],
        Projects: [],
        Distinction: [
          "2010 - Awarded INSPIRE FELLOWSHIP of Department of Science & Technology, India in 2010. ",
          "2010 - Qualified CSIR-JRF with AIR-34, June, 2010.",
          "2010 - Secured AIR-111 in GATE, 2010.",
          "2009 - Qualified NET with AIR-64 in December, 2009.",
          "2008 - Received University Gold Medal for securing first rank in order of Merit in the M. Sc. Examination in Applied Mathematics of M. J. P. R. U. Campus, Bareilly in 2008"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-neelam-choudhary/"),
    Faculty_model(
        Name: "Subhadeep Mondal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/08/bigDummy.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "subhadeep.mondal@bennett.edu.in",
        About:
            "Subhadeep Mondal is a theoretical high energy physicist. He studies phenomenology of a wide range of theoretical models attempting to address some of the most fundamental questions in particle physics. His expertise lies in the theoretical and phenomenological aspects of new physics search at the collider experiments, e.g., Large Hadron Collider, commonly known as the LHC. He is well versed with state-of-the-art collider search techniques of fundamental particles and is working towards improving the same in the context of specific theoretical frameworks. He has worked extensively in neutrino mass models, Higgs physics, supersymmetry and particle dark matter models. He has also worked in effective theories, specifically in the context of non-standard scalar interactions. ",
        Education: [
          " Ph.D. (2014), High Energy Physics  ",
          " Indian Association for the Cultivation of Science",
          "M.Sc. (2007), Physics  ",
          "Jadavpur University ",
          " B.Sc. (2005), Physics ",
          " Jadavpur University"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          " Postdoctoral Researcher, University of Helsinki, Finland",
          " Postdoctoral Researcher, Harish-Chandra Research Institute, India"
        ],
        Research: [
          "Particle phenomenology, beyond the standard model physics ",
          "Collider physics, new physics search at the Large Hadron Collider ",
          "Higgs Physics, neutrino mass models ",
          "Supersymmetry ",
          "Dark Matter "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/subhadeep-mondal/"),
    Faculty_model(
        Name: "Dr. Arti Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/30_Dr.-Arti-Singh-Assistant-Professor.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mathematics",
        Position: "null",
        Email: "arti.singh1@bennett.edu.in",
        About: "null",
        Education: [
          "PhD Financial Mathematics (2017)",
          " PhD (2017) Indian Institute of Technology (IIT) Delhi ",
          "M.Sc. (2010) Mathematics (2010)",
          "Indian Institute of Technology (IIT) Delhi ",
          "B.Sc. (2008)Mathematics, Physics, Chemistry",
          " F. G. Degree College Raebareli, C.S.J.M. Kanpur University "
        ],
        Experience: [
          "Assistant professor Bennett University School of Engineering & Applied Sciences",
          "Lecturer IIIT Nuzvid, R.G.U.K.T. Andhra Pradesh"
        ],
        Research: ["1. Financial Mathematics", "2.Operations research"],
        Projects: [],
        Distinction: [
          "Received Mrs. Santokh Gill Award for securing highest C.G.P.A. (9.067 out of 10 point scale) in M.Sc. Mathematics from Indian Institute of Technology Delhi",
          "Received Prof. M. C. Puri Gold Medal for securing highest C.G.P.A. (9.067 out of 10 point scale) in M.Sc. Mathematics from Indian Institute of Technology Delhi.",
          " ",
          " Achieved NBHM (National Board for Higher Mathematics) postgraduate scholarship from DAE (Department of Atomic Energy), Govt. of India during 2009-2010.",
          " ",
          " Achieved MCM (Merit-cum-Mean) scholarship from Indian Institute of Technology Delhi during 2008-2009.",
          " ",
          "Cleared CSIR (Council for Scientific and Industrial Research)-JRF (Junior Research Fellowship), June 2010 with All India Rank 147.",
          " ",
          "Cleared GATE (Graduate Aptitude Test for Engineering), 2013 with All India Rank 5"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-arti-singh/"),
    Faculty_model(
        Name: "Dr. Thounaojam Umeshkanta Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Umesh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "thounaojam.singh@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D. Physics (Nonlinear Science) (2011)",
          " Jawaharlal Nehru University, New Delhi",
          "M.Sc. Physics (2003)",
          " University of Delhi, Delhi",
          "B.Sc. (Hons) Physics (2001)",
          " University of Delhi, Delhi"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Assistant Professor, Shivaji College, University of Delhi",
          " Visiting Faculty, Ashoka University",
          " Assistant Professor, Central University of Rajasthan",
          "Postdoctoral Researcher, Department of Cell Biology and Anatomy, Louisiana State University Health Sciences Center, New Orleans, USA  ",
          "Postdoctoral Research Fellow, Max Planck Institute for the Mathematics in Sciences, Leipzig, Germany "
        ],
        Research: [
          "Nonlinear Dynamics  ",
          "Coupled Oscillators ",
          "Synchronization of Complex Networks ",
          "Stochastic Chemical Kinetics "
        ],
        Projects: [],
        Distinction: [],
        profile:
            "https://www.bennett.edu.in/faculties/dr-thounaojam-umeshkanta-singh/"),
    Faculty_model(
        Name: "Dr. Rama Koteswara Rao Kamineni",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/06/rama-Kamineni310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "rama.kamineni@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2014),Physics ",
          " Indian Institute of Science, Bangalore ",
          "M. Sc. (2005), Physics ",
          "Sri Venkateswara University, Tirupati",
          "B. Sc. (2003), Maths, Physics, Chemistry",
          " Nagarjuna University, Guntur"
        ],
        Experience: [
          "Assistant Professor, Bennett University ",
          " Post Doctoral Researcher, Technische Universitaet Dortmund, Germany ",
          "Post Doctoral Researcher, City University of New York, USA ",
          " Post Doctoral Researcher, Technische Universitaet Dortmund, Germany"
        ],
        Research: [
          "Quantum Information Processing",
          "Quantum Technologies using Nitrogen-Vacancy centers in diamond",
          "Nuclear Magnetic Resonance"
        ],
        Projects: [],
        Distinction: [],
        profile:
            "https://www.bennett.edu.in/faculties/dr-rama-koteswara-rao-kamineni/"),
    Faculty_model(
        Name: "Dr. Soumyendu Roy",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/10/Soumyendu-Roy310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "soumyendu.roy@bennett.edu.in ",
        About: "null",
        Education: [
          "Ph.D. (2014, M.Sc.  Ph.D. Dual Degree)",
          "Physics, Indian Institute of Technology Bombay",
          "M. Sc. (2014, M.Sc.  Ph.D. Dual Degree)",
          "Physics, Indian Institute of Technology Bombay",
          "B. Sc. (2006)",
          "Physics Honours, Vidyasagar University, West Bengal"
        ],
        Experience: [
          "Assistant Professor, Department of Physics, Bennett University, Greater Noida, India",
          "DST INSPIRE Faculty, Advanced Technology Development Centre, Indian Institute of Technology Kharagpur ",
          "Post Doctoral Fellow, School of Electrical Engineering, Tel Aviv University, Israel "
        ],
        Research: [
          " 1. Material Science ",
          " 2. Nanotechnology: Synthesis, modification and applications of Nanomaterials",
          " 3. Photovoltaics: Dye Sensitised Solar Cell, Perovskite Solar Cells",
          " 4. Sensors, Bio-medical devices like Artificial Retina",
          " 5. Electronics: Field emitters, Transistors, etc. built from Nanomaterials",
          " 6. Electrochemistry",
          " 7. Application of Plasma and Microwaves in Material Science"
        ],
        Projects: [],
        Distinction: [
          " DST INSPIRE Faculty Award, 2016, by the Dept. of Science and Technology, Gov. of India.",
          " The PBC Program for Fellowships for Outstanding Post-doctoral Fellows from China and India, 2014 - 2016 (by Council of Higher Education, Israel) ",
          " Reviewer for J. Appl. Phys. (pub. by American Institute of Physics), Carbon, Mater. Sci. Eng. B, Appl. Surf. Sci., Diamond Relat. Mater. (pub. by Elsevier), Res. Chem. Intermed. (pub. by Springer)",
          " Visiting Research Student at the University of Ulster Jordanstown campus, Northern Ireland, United Kingdom in 2010",
          " Summer Internship Programme for Indian Students (Computational Physics), 2008, National University of Singapore",
          " My article in Nano Letters, 14, 6685\u22126692, 2014, was covered in popular news and science magazines like The Scientist, ACS News, Indian media like Economic Times, NDTV Gadgets, Israeli media, etc. ",
          " My article in Energy Environ. Sci., 5, 7001, 2012, was highlighted by Renewable Energy Global Innovations as a key scientific article on their website ",
          " My article in Nanotechnology, 22, 225606, 2011, was highlighted in IOP Asia-Pacific news",
          " Two Best poster awards for presentations made at International Workshop on the Physics of Semiconductor Devices, 2011, IIT Kanpur."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-soumyendu-roy/"),
    Faculty_model(
        Name: "Dr. Swarup Panda",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/10/f1_Dr.-S.-K.-Panda.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "swarup.panda@bennett.edu.in",
        About:
            "Dr. Panda's research is focused on understanding the electronic, magnetic, optical and transport properties of  strongly correlated materials (typically materials containing partially filled d- or f-shells) using first-principles based approaches such as density functional theory (DFT) and dynamical mean field theory (DMFT). Website: ",
        Education: [
          "Ph.D. (2013)",
          "Centre for Advanced Materials, Indian Association for the Cultivation of Science (IACS)",
          "M. Sc. (2007)",
          "Physics , IIT Bombay",
          "B. Sc. (2004)",
          "Physics, Vidyasagar College, University of Calcutta"
        ],
        Experience: [
          "Assistant Professor, Bennett University",
          "Post Doctoral Researcher, Centre de Physique Theorique, Ecole Polytechnique, France ",
          "Post Doctoral Researcher, Department of Physics and Astronomy, Uppsala University, Sweden"
        ],
        Research: [
          "Theoretical and Computational Condensed Matter Physics ",
          "Studying and designing exotic correlated materials using first-principles approaches ",
          "Electronic structure, Magnetism and Spin-Orbit physics in transition-metal and rare earth compounds",
          "Nanomagnetism using ab-initio many-body techniques such as LDA+DMFT",
          "Low dimensional spin-systems ",
          "Calculations of Hubbard U from first-principles: constrained RPA"
        ],
        Projects: [],
        Distinction: [
          " Reviewer of the following journals: Physical Review Letters, Physical Review B, Journal of Physics and Chemistry of Solids, Materials Chemistry and Physics, Journal of Applied Physics, Journal of Electron spectroscopy and related phenomena, Solid state communication, Advanced Materials Letter"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-s-k-panda/"),
    Faculty_model(
        Name: "Dr. Ayan Khan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/61_Dr.-Ayan-Khan-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "ayan.khan@bennett.edu.in",
        About:
            "Dr. Ayan Khan is Ph.D from Department of Physics, University of Camrino, Italy, M.Sc. from Department of Physics, Indian Institute of Technology-Guwahati, India. His Research Interests include BCS-BEC Crossover and Bose Einstein Condensate (BEC), Integrable models and its application in ultra-cold atomic gases and nonlinear optics, Strongly Correlated Systems (SCS). Click to",
        Education: [
          "PhD (2010)",
          "Theoretical Condensed Matter Physics, University of Camerino, Camerino, Italy",
          "M.Sc (2005)",
          "Physics, Indian Institute of Technology (IIT), Guwahati",
          "B.Sc (2002)",
          "Physics (Hons.), Visva Bharati University, Santiniketan"
        ],
        Experience: [
          "Associate Professor,School of Engineering & Applied Sciences, Bennett University",
          "Assistant Professor - Gitam University, Bangalore",
          "Research Scientist - Indian Institute of Science Education and Research, Kolkata 2014",
          "Post-Doctoral - Research Associate Bilkent University, Ankara, Turkey",
          "Post-Doctoral - Fellow Pusan National University, Busan, South Korea 2010"
        ],
        Research: [
          " 1. Ultra-cold Atomic Gases (BCS-BEC Crossover)",
          " 2. Nonlinear Equations and Integrable Systems ",
          "3. Strongly Correlated Systems"
        ],
        Projects: [
          "\"Ultra-cold Atomic Gases in Disorder\"TUBITAK-BIDEP, with Bilkent University, Turkey, (September2012  August 2013)"
        ],
        Distinction: [
          "2013 - \"Bell Soliton in BCS-BEC Crossover\" highlighted as cover page in Journal of Physics B ",
          "2012 - Research Fellowship for Foreign Citizens awarded by Scientific and Technological Council of Turkey (TUBITAK)",
          "2005 - Junior Research Fellowship by Physical Research Laboratory, Department of Space, Govt. of India, Ahmedabad",
          "1999 - \"Young Scientist Fellowship-1999\" by Indian Institute of Science(IISc.), Bangalore."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ayan-khan/"),
    Faculty_model(
        Name: "Dr. Poulomi Sadhukhan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/59_Dr.-Poulomi-Sadhukhan-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "poulomi.sadhukan@bennett.edu.in",
        About: "null",
        Education: [
          "PhD Theoretical Condensed Matter Physics (2013)",
          " Institute of Physics, Bhubaneswar ",
          "M.Sc. Physics (2005)",
          " University of Calcutta",
          "BSc (Hons) Physics (2003)",
          " University of Calcutta "
        ],
        Experience: [
          "Associate Professor, School of Engineering & Applied Sciences, Bennett University",
          "Postdoc AMOLF, Amsterdam",
          "Postdoc Universit\u00e4t Gttingen, Germany"
        ],
        Research: [
          "1.Response of biopolymer assemblies under force and relaxation.",
          "2.Phases and phase transitions of DNA.",
          "3.Quantum entanglement and its connection to interacting polymers"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-poulomi-sadhukhan/"),
    Faculty_model(
        Name: "Dr. Ashvani Kumar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/51_Dr.-Ashvani-Kumar-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "ashvani.kumar@bennett.edu.in",
        About: "null",
        Education: [
          "PhD Materials Science (2009)",
          " Indian Institute of Technology (IIT), Roorkee",
          "MPhil Materials Science (2005)",
          "CCS University, Meerut",
          "MSc Electronics (2003)",
          " CCS University, Meerut "
        ],
        Experience: [
          "Associate Professor, School of Engineering & Applied Sciences, Bennett University",
          "Principal Research Scientist Diamond Elements Pvt. Ltd., Surat",
          "Postdoctoral Researcher Seoul National University, Korea",
          "Postdoctoral Researcher Kyungpook National University, Korea 2010 - 2012",
          "Postdoctoral Researcher, Indian Institute of Technology, Roorkee"
        ],
        Research: [
          "1.Solid State Nano-pore Devices for Biomolecule Detection.",
          "2.Fabrication & Characterization of Functional Nanostructures for MEMS & Optoelectronic Devices.",
          "3.Single, Poly- & Nano-crystalline Diamonds for their Applications in Semiconducting & Research Industries"
        ],
        Projects: [],
        Distinction: [
          " 2013 -Research work highlighted in Labtalk (Nanotechnology magazine, IOP publishing) titled as Could few layer graphene be used for ultrafast DNA sequencing?",
          " ",
          " 2012 - Research Fellowship from World Class University, South Korea",
          " ",
          " 2010 - Postdoctoral Fellowship from Brain Korea 21, South Korea "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ashvani-kumar/"),
    Faculty_model(
        Name: "Mr. Baij Nath Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/05/Mr.-Baij-Nath-Singh-Research-Associates.png",
        Designation: "Research Associates",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "null",
        Email: "Baijnath.singh@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (Pursuing)",
          "Mechanical Engineering - IIT Dhanbad",
          "M. Tech. (2013)",
          "Mechanical Machine Design-BIT Sindri",
          "B.Tech. (2010)",
          "Mechanical Engineering- NIET Greater Noida (UPTU)"
        ],
        Experience: [
          "Research Associates-Bennett University Department of Mechanical and Aerospace Engineering",
          "Design Engineer (Structural), Altran Technologies India Pvt Ltd, Noida",
          "Assistant Manager (CAE/FEA)/Project Manager, Anand Motor Products Pvt Ltd, Gurgaon",
          "Project Scientist, Department of Mechanical Engineering, IIT Kanpur",
          "Project Engineer, Advanced Composite Division (ABAQUS\u00ae/CAE), NAL Bangalore",
          " Project Assistant Level II, CIMFR DC CSIR, Digwadih Dhanbad"
        ],
        Research: [
          "Composite Materials",
          "Impact Tastings, Crash Testing",
          "Dynamic and Static Analysis",
          "Vibroacoustic, Sound Radiation (FGM & Composites)",
          "Finite Element Analysis (FEA)",
          "Numerical Machining"
        ],
        Projects: [],
        Distinction: [
          "2nd Topper in M.Tech Machine Design from BIT Sindri",
          "Involved in Industrial based academics for which I have been accredited by the department head and Professors"
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-baij-nath-singh/"),
    Faculty_model(
        Name: "Dr. Neelanchali Asija Bhalla",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/07/Neelanchali-Bhalla310x310.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "null",
        Email: "neelanchali.bhalla@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2017)",
          "Mechanical Engineering - IIT Delhi",
          "M. Tech. (2011)",
          "Nano Science and Technology, Guru Gobind Singh Indraprastha University, Delhi",
          "B. Tech. (2002)",
          "Mechanical and Automation Engineering, Guru Gobind Singh Indraprastha University, Delhi"
        ],
        Experience: [
          "Associate Professor - Bennett University Department of Mechanical and Aerospace Engineering",
          "Post Doctoral Fellow - Department of Mechanical Engineering, IIT Delhi ",
          "Lecturer - Department of Mechanical Engineering, JSS Academy of Technical Education, Noida ",
          "Manager - Ex- Instruments and Automation, New Delhi "
        ],
        Research: [
          "Manufacturing and testing of composite materials",
          "High strain rate testing using split Hopkinson pressure bar",
          "Bullet proof material systems development",
          "Polymer processing of blends",
          "Synthesis and characterization of Nanocomposites",
          "Rheology of non-Newtonian fluids and its applications in Ballistics"
        ],
        Projects: [],
        Distinction: [
          "Gold Medallist in M. Tech (Nano Science and Technology)",
          "Chapter entitled Durability of High Performance Ballistic Composites published in the book Lightweight Ballistic Composites (Vol. 2) - Military and Law-Enforcement Applications; Edited by Ashok Bhatnagar, Woodhead Publishing Limited, Cambridge England, CRC Press (2015), ISBN: 978-0-08-100406-7 "
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-neelanchali-asija-bhalla/"),
    Faculty_model(
        Name: "Dr. Pawan Mishra",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/05/pawanMishra-Research-Associates-Mechanical-and-Aerospace-Engineering.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "null",
        Email: "pawan.mishra@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D.",
          "Mechanical Engineering  Indian Institute of Technology (IIT-ISM) Dhanbad",
          " M. Tech.",
          "Manufacturing &amp; Automation - M.D.U. Rohtak",
          " B. Tech.",
          "Mechanical Engineering - U.P. Technical University, Lucknow"
        ],
        Experience: [
          "Assistant Professor in Department of Mechanical and Aerospace Engineering.at Bennett University, India",
          "Research Associates-Bennett University Department of Mechanical and Aerospace Engineering.",
          "Assistant Professor, Department of Mechanical Engineering, Krishna Engineering College, Ghaziabad. ",
          " Senior Lecturer, Department of Mechanical Engineering, Mahatma Gandhi Mission College of Engg. & Technology (MGMCoET), Sec 62, NOIDA.",
          " Lecturer, Department of Mechanical Engineering, Manav Rachna International University (MRIU), Faridabad, Haryana. ",
          " Lecturer, Department of Mechanical Engineering, Krishna Engineering College, Ghaziabad. "
        ],
        Research: [
          "Human Gait & Spine Posture Analysis during various Routine/Specific Activities. ",
          "Sports Bio-mechanics to Enhance Sport Performance and Reduce Injury for Players and Athletes. ",
          "Human Robotic Interaction on Assistive and Rehabilitation Technologies. ",
          "Quantification of Human Performance to Treat Musculoskeletal Disorders ",
          "Development of Low-cost Assistive & Occupational Technologies to Improve Mobility "
        ],
        Projects: [],
        Distinction: [
          "Two projects selected for funding by MSME, Govt. of India. (a) Development of low- cost device for foot categorization based on HVA and CSI.(b) Design & development of low-cost Hybrid Auto Terrain Vehicle.",
          "Best Research Paper Award for the paper based on Measurement of Scoliosis Parameters by using Surface Topography and Radiograph. Int. Ind. Conf. by Kutumb International, Goa. August 2019.",
          "Session Chair in Industry Academia Conclave 2018 under TEQIP-III on 18th May 2018 at THDC, IHET, Tehri, Uttarakhand, India.",
          "Organised One day workshop on Biomechanics based on Measurement of Spine and Foot parameters by surface topography using DIERS Statico-3D. (Aug 2019).",
          "Coordinated 3 days International Symposium of Physical Rehabilitation & Robotics Technologies (ISPRART 2018).",
          "Coordinated 3 days 35th International Journal of Vibro-Engineering Conference at Bennett University, Nov 2018. ",
          "Coordinated 3 days 43rd International Journal of Vibro-Engineering Conference at Bennett University, Dec 2019. ",
          "Participated in International workshop on computational Method in Vibration and Acoustics at IIT-ISM, Dhanbad from 16-21 March 2015."
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-pawan-mishra/"),
    Faculty_model(
        Name: "Dr. Mohammad Danish",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/41_Dr.-Mohammad-Danish-Assistant-Professor.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "null",
        Email: "mohammad.danish@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. Fluid Mechanics (2016)",
          "Indian Institute of Technology Delhi, India ",
          "M.Tech Mechanical Engineering (2007)",
          "Indian Institute of Technology Kanpur, India.",
          "B.Tech Mechanical Engineering (2004)",
          "Aligarh Muslim University, India"
        ],
        Experience: [
          "Assistant Professor, Department of Mechanical and Aerospace Engineering, Bennett University, Greater Noida, India",
          "Postdoctoral Fellow, Department of Mechanical Engineering, Johns Hopkins University, Baltimore, Maryland, USA",
          "Teaching Assistant, Department of Applied Mechanics, IIT Delhi, India ",
          "Lecturer, Department of Mechanical Engineering, Galgotias College of Engg. & Tech., Greater Noida, India",
          "Development Engineer, Flowmaster India Pvt Ltd (now FloMASTER, Mentor Graphics)"
        ],
        Research: [
          "Direct numerical simulations (DNS) of compressible and incompressible turbulent flows.",
          "Multiscale analysis of turbulence.",
          "Lagrangian-based analysis and modeling of velocity gradients in turbulence."
        ],
        Projects: [],
        Distinction: [
          "National Science Foundation fellowship, USA: 2016-2017.",
          "Member of American Physical Society, USA",
          "Member of Society of Automotive Engineers, India",
          "Received Flowmaster Star Performer awards at Flowmaster India (now Mentor Graphics) in two consecutive quarters of year 2009.",
          "MHRD Scholarship: 2012-2016, 2005-2007"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-mohammad-danish/"),
    Faculty_model(
        Name: "Dr. Rohan Katti",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Rohan-Katti310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "null",
        Email: "rohan.katti@bennett.edu.in",
        About:
            "I have completed my PhD from SRM Institute of Science and Technology in July 2020 under the Visvesvaraya PhD Scheme of the Ministry of Electronics and Information Technology (MeitY), Government of India. My research area is Microwave Photonics and I have worked on generation of high frequency RF signals such as microwave, millimeter wave and terahertz signals based on photonic approaches. I am looking forward to investigate the role of photonics in the upcoming 6G technology.",
        Education: [
          " Ph.D. (2020), Microwave Photonics ",
          " SRM Institute of Science and TechnologyMicrowave Photonics ",
          " M.Tech. (2015), Communication Systems ",
          " SRM Institute of Science and Technology ",
          "B.Tech. (2013), Electronics and Communication Engineering ",
          " Jawaharlal Nehru Technological University Hyderabad  "
        ],
        Experience: [" Assistant Professor, Bennett University"],
        Research: [
          "Microwave Photonics ",
          "Optical Computing ",
          "Optical Communications ",
          "All-Optical Signal Processing "
        ],
        Projects: [],
        Distinction: [
          "IET Optoelectronics (IET) ",
          "Silicon (Springer) ",
          "Journal of Optical Communications (De Gruyter) ",
          "International Travel Grant from Science and Engineering Research Board (SERB), Government of India for paper presentation in SPIE Photonics Europe Conference in April 2020. (Awarded but not availed due to COVID-19 pandemic) ",
          "Optical Society of America (OSA) Student award for poster presentation on \"All Optical Binary to Two's Complement Conversion Based on Microring Resonators\" In International Conference on Fibre Optics and Photonics at IIT Kanpur in 2016. ",
          "Visvesvaraya PhD Fellowship by Ministry of Electronics and Information Technology (MeitY), Government of India for PhD research work. ",
          "Gold Medal in M.Tech Communication Systems, 2015. "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rohan-katti/"),
    Faculty_model(
        Name: "Dr. Ankit Kumar Pandey",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/08/ankit310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "null",
        Email: "ankit.pandey@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D. (2018) ",
          " National Institute of Technology Delhi, Nanophotonic Devices (ECE Dept.)",
          "M.Tech. (2014)",
          " University of Allahabad, Electronics Engineering",
          "B.Tech.(2012) ",
          " GBTU (Now AKTU) Lucknow, Electronics and Communication Engineering (ECE)"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Research Associate , NIT, Delhi",
          " Visiting Research Scholar, National Chung Cheng University, Taiwan"
        ],
        Research: [
          "Surface Plasmon Resonance based Sensors (prism, grating and optical fibre configurations) ",
          "Heterojunction Phototransistors (HPT)",
          "Plasmonic Absorbers and Photodetectors ",
          "Group IV and two-dimensional (2D)materials ",
          "Plasmonic based sensing in THz region "
        ],
        Projects: [],
        Distinction: [
          "Reviewer: IEEE Sensors Journal, Optical Fiber Technology (Elsevier), Optics Express (OSA), Vacuum (Elsevier), Optical Material Express (OSA) etc. ",
          "Awards/Grants: Got selected for AIM-HI academic research program at Advanced Institute of Manufacturing with High-Tech Innovations (AIM-HI), National Chung Cheng University (CCU), Taiwan (Jun 2017- July 2017)."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ankit-kumar-pandey/"),
    Faculty_model(
        Name: "Dr. Deepali Atheaya",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/42_Dr.-Deepali-Atheaya-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "null",
        Email: "deepali.atheaya@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. Solar Energy (2016)",
          "Indian Institute of Technology Delhi, India",
          "M.Tech Industrial & Production Engineering (2002)",
          "Aligarh Muslim University, India",
          "B.Tech Mechanical Engineering (1998)",
          "Aligarh Muslim University, India"
        ],
        Experience: [
          "Associate Professor, Department of Mechanical and Aerospace Engineering, Bennett University, Greater Noida, India ",
          "Assistant Professor, Department of Mechanical and Aerospace Engineering, Bennett University, Greater Noida, India ",
          " Research Scholar, Centre for Energy studies, Indian Institute of Technology, Delhi, India",
          "Assistant Professor, Inderprastha Engineering College, Sahibabad, Ghaziabad, UP, India",
          "Lecturer, Department of Mechanical Engineering, ABES College of Engineering Ghaziabad, UP, India",
          "Visiting Faculty, Institute of Management Studies, IMS NOIDA-62, India",
          "Lecturer, Department of Mechanical Engineering, Shadan Engineering College, (JNTU ), Hyderabad, India"
        ],
        Research: [
          "Solar-thermal technologies and non-conventional energy resources",
          "Manufacturing processes, ergonomics and quality control",
          "Advanced welding technology"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-deepali-atheaya/"),
    Faculty_model(
        Name: "Dr. Rahul Mukherjee",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/Dr.-Rahul-Mukherjee.png",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "null",
        Email: "rahul.mukherjee@bennett.edu.in",
        About: "null",
        Education: [
          "  Ph.D. (2018), MEMS and VLSI Design ",
          "IIT Kharagpur",
          " M.Tech. (2010), VLSI Design ",
          "BESU (Now IIEST) Shibpur ",
          " B.E. (2004), Electronics and Comm. Engg. ",
          " NIT Durgapur "
        ],
        Experience: [
          "Associate Professor, Bennett University",
          "Assistant Professor, KIIT Bhubaneswar",
          "Lecturer, AOT Adisaptagram",
          "Lecturer, BCREC Durgapur"
        ],
        Research: [
          "CMOS MEMS based Smart Sensor ",
          "Inertial Sensors",
          "Signal Conditioning Circuits",
          "Thermoelectric Generators"
        ],
        Projects: [],
        Distinction: [
          " Reviewer of the following journals: IEEE Sensors, Sensors and Actuators A"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rahul-mukherjee/"),
    Faculty_model(
        Name: "Dr. Manoj Sharma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/MR-MANOJ-SHARMA.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "null",
        Email: "manoj.sharma1@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2020), Electrical Engineering Department",
          " IIT, Delhi ",
          " M. Tech. (2012), Signal Processing and Control ",
          " NIT, Hamirpur ",
          " B.Tech.(2009), Electronics & Communication Department",
          " UPTU"
        ],
        Experience: [
          "Assistant Professor, Bennett University",
          " Scientist Fellow (Quick Hire Scientist)CSIR-CEERI, Pilani  "
        ],
        Research: [
          "New trends in image and video restoration",
          "Medical Imaging and Explainable AI",
          "Robust OCRs",
          "Agriculture imaging and Food quality Analysis",
          "Smart camera systems and algorithms for security and surveillance",
          "Deep learning algorithms for various applications (i.e., Sensors data, Fashion, NLP, Anomaly Detection etc.)"
        ],
        Projects: [],
        Distinction: [
          " Fellowship from Samsung (Jan 2015 to Dec 2015), Fellowship from Interra Pvt. Ltd (July 2014 to Dec 2014), Gate Fellowship (July 2010 to June 2012) ",
          " Nominated for VISION INDIA paper in ICVGIP 2018, Call from IISF 2018 to show demo of seeds quality assessment technology ",
          " Guest Speaker in workshop of Deep Learning at BVP college Delhi. (2019)",
          "Guest Speaker and have conducted faculty training program on AI and its application at Lovely Professional University and Vignan University. (2019)",
          " Paper accepted in VISION INDIA. ICVGIP-2018.",
          "Three individual Paper and four team paper accepted in CVPRW proceedings (h5 index= 158).",
          "1st Rank in NIPS Challenge. NIPS-2018 challenge on Auto ML.",
          " 3rd Rank in CVPR Challenge. NTIRE-2019 challenge on Image Colorization.",
          "8th Rank in CVPR Challenge, NTIRE-2018 challenge on RGB to Hyperspectral conversion.",
          "11th Rank in CVPR Challenge, NTIRE-2019 challenge on Video Super-Resolution.",
          "11th Rank in ECCV Challenge, PIRM-2018 challenge on Perceptual Super-Resolution.",
          " 19th Rank in CVPR Challenge, NTIRE-2018 challenge on Image Super-Resolution.",
          "IISF-2018 (Presented demo of seeds quality assessment in IISF-2018)."
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-manoj-sharma/"),
    Faculty_model(
        Name: "Dr. Ajay Yadav",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/Dr-Ajay-Yadav.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "null",
        Email: "ajay.yadav@bennett.edu.in",
        About: "null",
        Education: [
          "  Ph.D. (2018), Telecom. Technology and Management ",
          "IIT Delhi ",
          " M. Tech. (2013), ECE ",
          "IIT (ISM) Dhanbad",
          "  B. Tech. (2010), ECE ",
          "Guru Jambheshwar University of Science and Technology, Hisar "
        ],
        Experience: [
          "Assistant Professor, Bennett University",
          "Assistant Professor, Government Women Engineering College Ajmer, Rajasthan"
        ],
        Research: [
          " Free Space Optical Communication ",
          "Visible Light Communication",
          "Underwater Communication ",
          " Smart Farming"
        ],
        Projects: [],
        Distinction: [
          " Recipient of National Photonics Fellowship (NPF)",
          "Gold medal for securing \ufb01rst position in M.Tech",
          "Summer Faculty Intern at IIT Bombay from June 10-July 10, 2019",
          "Reviewer: Optics Express (OSA), Applied Optics (OSA), Photonic Network Communications (Springer), and Optik"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ajay-yadav/"),
    Faculty_model(
        Name: "Dr. Lokesh Kumar Sharma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-LokeshB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Lokesh.sharma@bennett.edu.in",
        About:
            "Dr. Lokesh has completed his PhD in 2017 from MNIT Jaipur in the area of Natural Language Processing. Earlier, he completed his MTech in ICT specifically in Intelligent Systems and Robotics from Gautam Buddha University, Greater Noida in the year 2013. He completed his BTech from Govt Engineering College Ajmer in the year of 2011. He is an expert in the area of Natural Language Processing and Question Answering with extraordinary programming skills.",
        Education: [
          "PhD (Computer science)",
          "MNIT Jaipur",
          "M.Tech. (Computer Science)",
          "GBU Greater Noida",
          "B. Tech. (Computer Science)",
          "Govt. Engineering College Ajmer"
        ],
        Experience: [
          "Bennett University, Noida",
          "CERI Education",
          "Galgotias College, Greater Noida",
          "SKIT Jaipur"
        ],
        Research: [
          "Natural Language Processing",
          "Question Answering",
          "Information Extraction",
          "Deep Learning"
        ],
        Projects: [
          "Automated Vertical Farming: It is fully automated vertical farming system. The system will not require any soil medium which means that even if the land is not fit for cultivation then also it can be used for the agricultural processes."
        ],
        Distinction: [
          "Best faculty award by department for extraordinary result of BTech students in college.",
          "Project selected in MHRD sponsored event at PSIT Kanpur."
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-lokesh-kumar-sharma/"),
    Faculty_model(
        Name: "Dr. Deepika Vatsa",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-DeepikaB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Deepika.vatsa@bennett.edu.in",
        About:
            "Dr. Vatsa was born in New Delhi, India. She completed an Honours B.Tech. degree in Computer Science  Engineering from PTU in 2010. She completed a M.Tech. degree at DTU in 2013, where she studied Information Systems. In 2013, she began her doctoral studies in the Department of Electrical Engineering at IIT Delhi. She pursued her research in Computational Systems Biology which lies at the interface of Machine learning and Systems biology. Her doctoral research investigates the identification of transition-based models for the inference of sub-cellular networks.",
        Education: [
          "PhD (Computational Systems Biology)",
          "Indian Institute of Technology Delhi(IIT Delhi)",
          "M.Tech. (Information Systems)",
          "Delhi Technological University",
          "B. Tech. (Computer Science & Engineering)",
          "Punjab Technical University"
        ],
        Experience: [
          "Bennett University, Noida",
          "DIT University, Dehradun",
          "IIT Delhi",
          "Delhi Technological University"
        ],
        Research: [
          "Computational Systems Biology",
          "Machine Learning",
          "Predictive modelling"
        ],
        Projects: [],
        Distinction: [
          "Qualified UGC NET December 2012 in Computer Science and Applications",
          "Qualified GATE 2011 in Computer Science (98.6% )"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-deepika-vatsa/"),
    Faculty_model(
        Name: "Dr. Rajesh Kumar Shrivastava",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Rajesh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "rajesh.shrivastava@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (Computer Science and Engineering)",
          "BITS-Pilani",
          "ME (Computer Science and Engineering)",
          "RGPV, Bhopal"
        ],
        Experience: [
          "Bennett University, Noida",
          "GCET, Hyderabd",
          "BITS-Pilani, Hyderabad"
        ],
        Research: [
          "Internet of Things",
          "Machine Learning",
          "Deep Learning",
          "Security"
        ],
        Projects: [],
        Distinction: ["Reviewer of Journal of Computer Security"],
        profile:
            "https://www.bennett.edu.in/faculties/dr-rajesh-kumar-shrivastava/"),
    Faculty_model(
        Name: "Dr. Vishal Srivastava",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-VishalB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "vishal.srivastava@bennett.edu.in",
        About:
            "He has completed the Ph.D from IIT-BHU in 2021 and M.Tech from IIT(ISM)-Dhanbad in 2015. He has 2.5 years of teaching and research experience. His key research areas are optimization, computer vision, graph mining and Computational intelligence domain.",
        Education: [
          "PhD (Computer science)",
          "IIT(BHU), Varanasi",
          "M.Tech. (CSE, DIP, and RS/GI)",
          "IIT(ISM), Dhanbad",
          "B. Tech. (Computer Science and Engineering)",
          "INTEGRAL UNIVERSITY"
        ],
        Experience: [
          "Bennett University, Noida",
          "DIT-University, Dehradun",
          "PSIT-KANPUR",
          "KIT-Varanasi"
        ],
        Research: [
          "Computer vision",
          "Optimization",
          "Machine learning",
          "Data Mining"
        ],
        Projects: [],
        Distinction: [
          "Reviewer in Pattern Recognition",
          "Reviewer in Wireless personal communications"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-vishal-srivastava/"),
    Faculty_model(
        Name: "Dr. Vikash Kumar Rai",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Vikas310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Vikash.rai@bennett.edu.in",
        About:
            "Dr.  Rai earned his PhD in Computer Science & Engineering at the Indian Institute of Technology Patna, India in August 2021. Earlier, he completed  M.Tech. (in Cyber Security) from Defence Institute of Advanced Technology Pune, India in 2014. He works  in the field of lightweight cryptographic primitives. Not only has he worked in several security fields such as hardware security, IoT device authentication, Random number generators, physical unclonable functions, but he has also deep knowledge in all these fields.",
        Education: [
          "PhD (Computer Science and Engineering)",
          "Indian Institute of Technology (IIT) Patna, India",
          "M.Tech. (Cyber Security)",
          "Defence Institute of Advanced Technology Pune, India",
          "B. Tech. (Computer Science and Engineering)",
          "Hi-Tech Institute of Engineering and Technology Ghaziabad, India"
        ],
        Experience: [
          "Bennett University, Noida",
          "Indian Institute of Technology Patna, India",
          "Defence Institute of Advanced Technology Pune, India"
        ],
        Research: [
          "Random Number Generators",
          "IoT Device Authentication",
          "Physical Unclonable Function"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-vikash-kumar-rai/"),
    Faculty_model(
        Name: "Dr. Sonal Kukreja Bhardwaj",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Sonal310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "sonal.kukreja@bennett.edu.in",
        About:
            "Dr. Sonal Kukreja Bhardwaj has completed her Ph.D. in 2021 and M.Tech. in 2015 in Computer Science and Engineering from Thapar Institute of Engineering and Technology, Patiala. Her research interest lies in Image Processing, Visual Cryptography and Computer Vision with multiple publications in SCI journals and International Conferences. Along with that she is a public speaker in many technical events and conferences. She is a highly motivated educator, coder and researcher.",
        Education: [
          "Ph.D (Computer Science and Engineering)",
          "Thapar Institute of Engineering and Technology, Patiala",
          "M.Tech. (Computer Science and Applications)",
          "Thapar Institute of Engineering and Technology, Patiala",
          "B.Tech (Computer Science and Engineering)",
          "Poornima College of Engineering, Jaipur (RTU)"
        ],
        Experience: [
          "Bennett University, Noida",
          "GD Goenka University, Gurugram",
          "Poornima University, Jaipur"
        ],
        Research: [
          "Image Processing",
          "Visual Cryptography",
          "Computer Vision",
          "Image Security, Copyright Protection and Authentication of Digital Image"
        ],
        Projects: [
          "Sonal Kukreja, Singara Singh Kasana, Geeta Kasana, Visual cryptography based robust copyright protection scheme to secure online color images with multiple owners, Applications of Digital Image Processing XLII, SPIE Optics+Photonics 2019, San Diego, USA"
        ],
        Distinction: ["UGC NET 2014 Qualified", "GATE 2011-2013 Qualified"],
        profile:
            "https://www.bennett.edu.in/faculties/dr-sonal-kukreja-bhardwaj/"),
    Faculty_model(
        Name: "Dr. Arka Ghosh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Akra310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Arka.Ghosh@bennett.edu.in",
        About:
            "Mr. Ghosh submitted his PhD thesis in Computer Science & Technology at the Indian Institute of Engineering Science & Technology, Shibpur in 2021. Prior to this, he was working as a evolutionary computation researcher at Indian Statistical Institute, Kolkata, India. Earlier, he completed M.Tech. (in Information Technology) from IIEST, Shibpur India in 2015. He works at the intersection of evolutionary computation and machine learning to solve engineering problems. He worked in several research domain like biomedical engineering, machine learning, data mining etc.",
        Education: [
          "Ph.D (Computer Science & Technology)",
          "Indian Institute of Engineering Science &amp; Technology, Shibpur",
          "M.Tech. (Information Technology)",
          "Indian Institute of Engineering Science &amp; Technology, Shibpur",
          "B.Tech (Computer Science & Engineering)",
          "West Bengal University of Technology, Kolkata"
        ],
        Experience: [
          "Bennett University, Noida",
          "Indian Statistical Institute, Kolkata",
          "Universitat Pompeu Fabra (UPF), Barcelona, Spain"
        ],
        Research: [
          "Evolutionary Computation",
          "Adversarial Machine Learning",
          "Data Mining",
          "Neuro-Evolution"
        ],
        Projects: [
          "Arka Ghosh, Bing Xue, Mengjie Zhang. \"Binary Differential Evolution based Feature Selection Method with Mutual Information for Imbalanced Classification Problems\". Proceedings of 2021 IEEE Congress on Evolutionary Computation (CEC 2021). Krasow, Poland. 28 June - 01 July 2021.",
          "Arka Ghosh, Rammohan Mallipeddi, Swagatam Das, and Asit Kr Das. \"A switched parameter differential evolution with multi-donor mutation and annealing based local search for optimization of lennard-jones atomic clusters.\" In 2018 IEEE Congress on Evolutionary Computation (CEC), pp. 1-8. IEEE, 2018.",
          "Arka Ghosh, Swagatam Das, Bijaya Ketan Panigrahi, and Asit Kr Das. \"A noise resilient differential evolution with improved parameter and strategy control.\" In 2017 IEEE Congress on Evolutionary Computation (CEC), pp. 2590-2597. IEEE, 2017."
        ],
        Distinction: [
          "Reviewer of IEEE Transaction on Cybernetics, IEEE Transaction of Neural Networks and Learning Systems, IEEE Access.",
          "Reviewer of Elsevier Information Sciences, Swarm and Evolutionary Computation, Applied Soft Computing."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-arka-ghosh/"),
    Faculty_model(
        Name: "Dr. Simar Preet Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Simranpreet310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "simarpreet.singh@bennett.edu.in",
        About:
            "Dr. Simar Preet Singh, PhD, is Assistant Professor at School of Engineering and Applied Sciences, Bennett University, Greater Noida, Uttar Pradesh, India. He was previously affiliated with GNA University, Phagwara, and Chandigarh Engineering College, Ajitgarh, India and has worked with Infosys Limited and DAV University, Jalandhar, India. He has published papers in SCI/SCIE/Scopus-indexed journals and has presented many research papers at various national and international conferences in India and abroad. His areas of interests include cloud computing, fog computing, Internet of Things (IoT), big data and machine learning. He earned his doctoral degree at Thapar Institute of Engineering and Technology, Patiala, India, and also holds several specialized certifications, including like Microsoft Certified System Engineer (MCSE), Microsoft Certified Technology Specialist (MCTS), and Core Java. He had also undergone a training program for VB.Net and Cisco Certified Network Associates (CCNA). More information at www.simarpreetsingh.com ",
        Education: [
          "Ph.D (Computer Science & Engineering)",
          "Thapar Institute of Engineering and Technology(TIET)",
          "M.Tech. (Computer Science & Engineering)",
          "Punjabi University, Patiala",
          "B. Tech (Computer Science & Engineering)",
          "Punjab Technical University, Jalandhar"
        ],
        Experience: [
          "Bennett University, Noida",
          "GNA University, Phagwara",
          "Chandigarh Engineering College (CEC), Chandigarh Group of Colleges (CGC), Landran, Mohali",
          "Thapar Institute of Engineering and Technology, Patiala",
          "Thapar Institute of Engineering and Technology, Patiala",
          "DAV University, Jalandhar",
          "Infosys Limited"
        ],
        Research: [
          "Fog Computing",
          "Cloud Computing",
          "Internet of Things (IoT)",
          "Machine Learning"
        ],
        Projects: [
          "Simar Preet Singh, Supriya Shrivastav, Neeraj Singla, Harmandeep Kaur (2020), \"Cloud Computing: Security Challenges and Issues\", AICTE SPONSORED \"International Conference on Computational Methods in Science & Technology (ICCMST 2020), SCOPUS Indexed, https://jnronline.com/ojs/index.php/about/article/view/62",
          "Simar Preet Singh & Preetinder Kaur (2011), Multi Agent Based Support in Distributed Data Mining, International Conference on Advances in Computing and Communication (ICACC-2011), NIT, Hamirpur, Pg. 249-252, sponsored by IEEE-MTTS."
        ],
        Distinction: [
          "Reviewer of The Journal of Supercomputing",
          "Reviewer of Journal of Ambient Intelligence and Humanized Computing"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-simar-preet-singh/"),
    Faculty_model(
        Name: "Dr. Ishan Budhiraja",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Ishan310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Ishan.budhiraja@bennett.edu.in",
        About:
            "Dr. Ishan Budhiraja earned his Ph.D.  in Computer Science Engineering from the Thapar Institute of Engineering and Technology, Patiala, India in 2021. He received M.Tech. and B. Tech degree in Electronics and Communication Engineering from Maharishi Dayanand University, Rohtak, Haryana, in 2012 and Uttar Pradesh Technical University, Lucknow, India, in 2008, respectively. He worked as a Research Associate on the project Energy Management of Smart Home using cloud Infrastructure-A Utility Perspective, funded by CSIR, New Delhi, India. Some of his research findings are published in top-cited journals, such as IEEE Transactions on Industrial Informatics, IEEE Transactions on Vehicular Technology, IEEE Transactions on Mobile Computing, IEEE Internet of Things, IEEE Wireless Communication Magazine, IEEE Systems Journal, and various international top-tiered conferences, such as IEEE GLOBECOM, IEEE ICC, IEEE WCMC, ACM, and IEEE Infocom. His research interests include device-to-device communications, the Internet of Things, Non-orthogonal multiple access, femtocells, deep reinforcement learning, and microstrip patch antenna.",
        Education: [
          "Ph.D (Computer Science & Engineering)",
          "Thapar Institute of Engineering and Technology(TIET)",
          "M.Tech. (Electronics and Communication Engineering)",
          "Maharishi Dayanand University",
          "B. Tech (Electronics and Communication Engineering)",
          "Uttar Pradesh Technical University"
        ],
        Experience: [
          "Bennett University, Noida",
          "Dewan V S Institute of Technology",
          "Council of Scientific and Industrial Research",
          "JPIET, Meerut"
        ],
        Research: [
          "Internet of Things",
          "Device-to-Device Communication",
          "Non-Orthogonal Multiple Access",
          "Deep Reinforcement Learning",
          "Energy Harvesting"
        ],
        Projects: [
          "Energy Management of Smart Home Using Cloud Infrastructure: A Utility Perspective",
          "Magnetometer based Landmine detection using Deep Learning",
          "I. Budhiraja, R. Gupta, N. Kumar, S. Tyagi, and S. Tanwar Interference Mitigation and Secrecy Ensured for NOMA-Based D2D Communications Under Imperfect CSI, in IEEE International Conference on Communication, ICC, Montreal, Canada, pp.1-6, June 2021.",
          "I. Budhiraja, N. Kumar, S. Tyagi, S. Tanwar, Gaurav Srivastava, and Mamoun Alazab Energy Management Scheme for Wireless Powered D2D Users with NOMA Underlaying Full Duplex UAV, in 2nd International Workshop on Drone Assisted Wireless Communications for 5G and Beyond with ACM MobiCom (DroneCom), pp.1-6, Sept. 2020.",
          "I. Budhiraja, S. Tyagi, S. Tanwar, N. Kumar, and N. Guizani, Subchannel Assignment for SWIPT-NOMA based HETNET with imperfect channel state information, 15th International Wireless Communications Mobile Computing Conference, IWCMC, Tangier, Morocco, pp. 842-847, June 2019.",
          "I. Budhiraja, S. Tyagi, S. Tanwar, N. Kumar, and M. Guizani, CR-NOMA based Interference Mitigation Scheme for 5G Femtocells Users, in IEEE Global Communications Conference, GLOBECOM, Abu Dhabi, United Arab Emirates, Dec. 2018.",
          "I. Budhiraja, V. Rishiwal, O. Singh, S. Tanwar, S. Tyagi, N. Kumar, and M. S. Obaidat, Base Station Oriented Multi Route Diversity Protocol for Wireless Sensor Networks, in IEEE Globecom Workshops, GC Workshops, Abu Dhabi, United Arab Emirates, Dec. 2018."
        ],
        Distinction: [
          "Reviewer of IEEE Transactions of Vehicular Technology",
          "Reviewer of IEEE Transactions of Wireless Communication",
          "Reviewer of IEEE Transactions of Green Communication and Networking"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ishan-budhiraja/"),
    Faculty_model(
        Name: "Dr. Abinash Pujahari",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Abinash310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "abinash.pujahari@bennett.edu.in",
        About:
            "Dr. Pujahari completed his Ph.D. in Computer Science & Engineering from National Institute of Technology Raipur in 2021. Earlier, he completed M.Tech. in Computer Science from SUIIT, Sambalpur University, in 2013. He works in collaborative filtering based recommender systems, specifically on improving the ranking quality of the recommendation process. His interests also include handling the change in users preferences over time in collaborative filtering models.",
        Education: [
          "Ph.D (Computer Science & Engineering)",
          "NIT Raipur",
          "M.Tech. (Computer Science)",
          "Sambalpur University",
          "MCA (Computer Application)",
          "SOA University"
        ],
        Experience: [
          "Bennett University, Noida",
          "Ravenshaw University",
          "SUIIT, Sambalpur University"
        ],
        Research: [
          "Recommender Systems",
          "Information Retrieval",
          "Data Science"
        ],
        Projects: [
          "Abinash Pujahari, and Vineet Padmanabhan. \"Group Recommender Systems: Combining user-user and item-item Collaborative filtering techniques.\" 2015 International Conference on Information Technology (ICIT). IEEE, 2015.",
          "Sisodia, Dilip Singh, Somdutta Vishwakarma, and Abinash Pujahari. \"Evaluation of machine learning models for employee churn prediction.\" 2017 International Conference on Inventive Computing and Informatics (ICICI). IEEE, 2017.",
          "Pujahari, Abinash, and Vineet Padmanabhan. \"An approach to content based recommender systems using decision list based classification with k-DNF rule set.\" 2014 International Conference on Information Technology. IEEE, 2014.",
          "Pujahari, Abinash, and Vineet Padmanabhan. \"A new grouping method based on social choice strategies for group recommender system.\" Computational Intelligence in Data Mining-Volume 1. Springer, New Delhi, 2015. 325-332.",
          "Pujahari, Abinash, and Dilip Singh Sisodia. \"Model-based collaborative filtering for recommender systems: An empirical survey.\" 2020 First International Conference on Power, Control and Computing Technologies (ICPC2T). IEEE, 2020."
        ],
        Distinction: [
          "Reviewer of IEEE Transactions on Services Computing",
          "2019- Travel Grant: ACM SIGCHI Gary Marsden Travel Award"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-abinash-pujahari/"),
    Faculty_model(
        Name: "Dr. Arjun Kumar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/09/35_Dr.-Arjun-Kumar-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Electronics and Communications Engineering",
        Position: "null",
        Email: "arjun.kumar@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2014)",
          "Indian Institute of Technology (IIT) Roorkee, RF and Microwave Engineering",
          "M.Tech. (2010)",
          "Graphic Era University, Dehradun, Microwave and Mobile Communication",
          "B.Tech (2004)",
          "U.P. Technical University, Lucknow, Electronics and Communication Engineering"
        ],
        Experience: [
          "RF Design Engineer - INTEL Labs-Guadalajara, Mexico",
          "Research Professor Korea University, South Korea",
          "Lecturer, Galgotias College of Engineering Technology, Greater Noida"
        ],
        Research: [
          "Microstrip Filters, SAW Filters, Inductors",
          "Microwave and Milli-meter wave circuits, EBG, PBG, DGS and meta-materials",
          "Small Antennas, Waveguide Transitions, Antenna for THz Application"
        ],
        Projects: [
          "Arjun Kumar, \"\"Design of 5G Programmable SAW Filter\"\", Intel Technology, Mexico (May 2016  April 2017)",
          "Arjun Kumar, \"\"Design of Small Antenna for Insect Robot at 2.4GHz\", Korea University, South Korea, (Jan. 2015  Dec. 2015)."
        ],
        Distinction: [
          "2014 - BK21 Plus Post-Doctoral-Fellowship, Government of South Korea",
          "2013 - Nelson-Mandela Post-Doctoral Fellowship at Kwazulu Natal University, Durban",
          "2010-2014- MHRD Government of India PhD fellowship through GATE"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-arjun-kumar/"),
    Faculty_model(
        Name: "Dr. Vijay Kumar Yadav",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr.-Vijay-Photo310x310.png",
        Designation: "Assistant professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "vijay.yadav@bennett.edu.in",
        About:
            "Dr. Vijay has earned his M.Tech & Ph.D. from Department of Cyber Law and Information security, Indian Institute of Information Technology, Allahabad. His thesis deals with the oblivious transfer for location-based services. He published his research work in various SCI/SCIE indexed journals and also presented his work in different National & International Conferences which show his research quest. He also served as reviewer of several prestigious and peer reviewed journals. His research area includes Cryptography, and Information Security  etc.",
        Education: [
          "Ph.D (Information Technology)",
          "Indian Institute of Information Technology Allahabad",
          "M.Tech (Cyber Law and Information Security)",
          "Indian Institute of Information Technology Allahabad"
        ],
        Experience: [
          "Bennett University, Noida",
          "National Institute of Technology, Patna",
          "Indian Institute of Information Technology Allahabad"
        ],
        Research: [
          "Cryptography",
          "Information security",
          "Lattice-based Cryptography.",
          "Vehicular ad-hoc network and Internet-of-Things, etc."
        ],
        Projects: [
          "Vijay Kumar Yadav, Shekhar Verma, S. Venkatesan, Man in the Middle Attack on NTRU Key Exchange First International Conference, CNC 2018, Gwalior, India, March 22-24, 2018.",
          "Vijay Kumar Yadav, Rakesh Kumar Yadav, Brijesh Kumar Chaurasia, Shekhar Verma, S. Venkatesan, MITM Attack on Modification of Diffie-Hellman Key Exchange Algorithm Second International Conference, CNC 2019, Gwalior,India."
        ],
        Distinction: [
          "Reviewer of IEEEAccess",
          "Reviewer of Journal of supercomputing",
          "Reviewer of IEEE System Journal",
          "Reviewer of ACM Transactions on Software Engineering and Methodology"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-vijay-kumar-yadav/"),
    Faculty_model(
        Name: "Dr. Ashima Yadav",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Dr-Ashima-Yadav310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "ashima.yadav@bennett.edu.in",
        About:
            "Dr. Ashima completed her PhD from Delhi Technological University. She has also worked as a software engineer at NIIT Technologies limited. Her research areas involve applying deep learning-based techniques for social media analysis, Deepfakes detection and medical image analysis.  She has published many papers in Elsevier, Springer, IEEE and ACM Transactions.",
        Education: [
          "Ph.D (2021) (Information Technology)",
          "Delhi Technological University (DTU)",
          "MCA (2016) (Computer Applications)",
          "GGSIPU",
          "Bachelors in Science (Hons) (2013) (Computer Science)",
          "University of Delhi"
        ],
        Experience: [
          "Bennett University, Noida",
          "Delhi Technological University",
          "Delhi Technological University",
          "NIIT Technologies Ltd."
        ],
        Research: [
          "Deep Learning",
          "Machine Learning",
          "Sentiment Analysis",
          "Deepfakes detection",
          "Medical image analysis"
        ],
        Projects: [
          "Ashima Yadav, Dinesh Kumar Vishwakarma. A Weighted Text Representation framework for Sentiment Analysis of Medical Drug Reviews. at IEEE Sixth International Conference on Multimedia Big Data (BigMM), IIIT Delhi, 2020.",
          "Ashima Yadav, Dinesh Kumar Vishwakarma. A Multilingual Framework of CNN and Bi-LSTM for Emotion Classification. at IEEE 11th International Conference on Computing, Communication and Networking Technologies (ICCCNT), IIT Kharagpur, 2020.",
          "Ashima Yadav, Ayush Agarwal, and Dinesh Kumar Vishwakarma. XRA-net framework for visual sentiments analysis. at IEEE Fifth International Conference on Multimedia Big Data (BigMM), National University of Singapore, Singapore, 2019.",
          "Ayush Agarwal, Ashima Yadav, and Dinesh Kumar Vishwakarma. \"Multimodal sentiment analysis via RNN variants.\" at IEEE International Conference on Big Data, Cloud Computing, Data Science & Engineering (BCD), Hawaii, USA, 2019.",
          "Rahul Katarya and Ashima Yadav, A comparative study of genetic algorithm in sentiment analysis at IEEE 2nd International Conference on Inventive Systems and Control (ICISC), at JCT College of Engineering and Technology, India, 2018"
        ],
        Distinction: [
          "Commendable Research Award by Delhi Technological University for excellence in research in the year 2020 and 2021.",
          "Mrs. Asha Rani Sethi Memorial Scholarship: Awarded for best all-around student in computer science by the Department of Computer Science, University of Delhi (2013).",
          "Reviewer of the following journals: \u2022 IEEE Transactions in Multimedia\u2022 IEEE Signal Processing Letters\u2022 Artificial Intelligence Review, Springer\u2022 Soft Computing, Springer\u2022 Knowledge and Information Systems, Springer"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ashima-yadav/"),
    Faculty_model(
        Name: "Dr. Neeraj",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Mr.-Neeraj-Photo310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "neeraj@bennett.edu.in",
        About:
            "I am Assistant Professor in Department of Computer Science Engineering, Bennett University, India. I am passionate about my work and I have steady source of motivation that drives me to do my best. My research interests include Cloud Computing, Decision making Systems, Development of Service Mapping Algorithms, and Internet of Things.",
        Education: [
          "Ph.D (Computer Science and Engineering)",
          "SLIET, Longowal",
          "M.Tech (Computer Science and Engineering)",
          "SLIET Longowal",
          "B.Tech (Computer Science and Engineering)",
          "B.Tech"
        ],
        Experience: ["Bennett University, Noida"],
        Research: [
          "Cloud Computing",
          "Decision making Systems",
          "Development of Service Mapping Algorithms",
          "Internet of things"
        ],
        Projects: [
          "Neeraj Yadav, Major Singh Goraya, Two-way Ranking Based Service Mapping in Cloud Environment, Future generation Computer Systems (2018): 53-66, doi: 10.1016/j.future.2017.11.027.",
          "Neeraj, Major Singh Goraya, Damanpreet Singh, A Comparative analysis of Prominently used MCDM methods in cloud environment, The Journal of Supercomputing Computing (2020): 1-21, doi: 10.1007/s10586-020-03065-7.",
          "Neeraj, Major Singh Goraya, Damanpreet Singh, Satisfaction aware QoS-based bidirectional service mapping in cloud environment, Cluster Computing (2020): 1-21, doi:10.1007/s10586-020-03065-7.",
          "Neeraj, Major Singh Goraya, Damanpreet Singh, A Ranking Based Model for Selecting Optimum Cloud Geographical Region, International Journal of Innovative Technology and Exploring Engineering (2019):793-797, doi: 10.35940/ijitee.J8908.0881019.",
          "Neeraj, Major Singh Goraya, Damanpreet Singh, Mutual Reputation Based Service Mapping in Cloud Environment. Seventh International Conference on Advances in Computing Electronics and Communication ACEC2018 (2018):79-84, doi: 10.15224/978-1-63248-157-3-32."
        ],
        Distinction: ["Reviewer of The Journal of Supercomputing"],
        profile: "https://www.bennett.edu.in/faculties/dr-neeraj/"),
    Faculty_model(
        Name: "Dr. Vivek Mehta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Mr-Vivek-Photo310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "vivek.mehta@bennett.edu.in",
        About:
            "Mr. Vivek Mehta has been a Ph.D. research scholar in Thapar Institute of Engineering and Technology during which he worked at the intersection of Machine Learning and Text analytics. After submitting his Ph.D. thesis, Mr. Vivek Mehta joined Bennett University in August 2021 as Assistant Professor. His research interests lie in the areas of Machine Learning, Deep Learning and Text analytics. He has published research papers in reputed SCI journals of high impact such as Artificial Intelligence Review (Springer) and Expert Systems with Applications (Elsevier). He is also a reviewer of the journal Knowledge-Based Systems.",
        Education: [
          "PhD (Computer Science and Engineering)",
          "Thapar Institute of Engineering and Technology, Patiala",
          "M.E (2016) (Computer Science and Engineering)",
          "Thapar Institute of Engineering and Technology, Patiala",
          "B.Tech (2014) (Computer Engineering)",
          "Guru Jambheshwar University of Science and Technology, Hisar"
        ],
        Experience: [
          "Bennett University, Noida",
          "Thapar Institute of Engineering and Technology, Patiala"
        ],
        Research: ["Text Analytics", "Machine Learning", "Deep Learning"],
        Projects: [],
        Distinction: ["Reviewer of Knowledge-Based Systems"],
        profile: "https://www.bennett.edu.in/faculties/dr-vivek-mehta/"),
    Faculty_model(
        Name: "Dr. Neha Garg",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/08/Ms.-Neha-Photo310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "neha.garg@bennett.edu.in",
        About:
            "I am working as an assistant professor in Department of Computer Science Engineering, Bennett University India. My research interest includes Cloud Computing, Green Computing, Workflow Scheduling, Decision making Systems.",
        Education: [
          "Ph.D (Computer Science and Engineering)",
          "SLIET, Longowal",
          "M.Tech (Computer Science and Engineering)",
          "SLIET, Longowal",
          "B.Tech (Computer Engineering)",
          "Punjabi University, Patiala"
        ],
        Experience: ["Bennett University, Noida"],
        Research: [
          "Cloud Computing",
          "Green Computing ",
          "Workflow Scheduling",
          "Decision making Systems"
        ],
        Projects: [
          "Neha Garg, Damanpreet Singh, Major Singh Goraya, Power and Resource-Aware VM Placement in Cloud Environment, in 8th IACC International Advance Computing Conference 2018, pp.113-118, 2018. doi: 10.1109/IADCC.2018.8692118."
        ],
        Distinction: [
          "Reviewer of the Journal of Supercomputing",
          "Reviewer of Computing",
          "Reviewer of IEEE Transactions on Industrial Informatics"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-neha-garg/"),
    Faculty_model(
        Name: "Dr. Rajendra Choudhary",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/04/Rajendra310x310-1.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "rajendra.choudhary@bennett.edu.in",
        About:
            "Dr. Choudhary was a post-doctoral Research Scientist at the Institute of Applied Mathematics, Leibniz Universit\u00e4t Hannover (IfAM) from March 2020 to February 2021. He earned his PhD in Computer Science & Engineering at the Indian Institute of Technology Indore, India in 2019. Earlier, he completed  M.Tech. (in Robotics) from IIIT Allahabad, India in 2013. He work at the intersection of Computer Science and Mathematics to solve engineering problems. Not only has he worked in several scientific fields such as model order reduction, stability of iterative solvers, computational science, and optimization, but he has also deep knowledge in all these fields.",
        Education: [
          "Ph.D.",
          "Indian Institute of Technology Indore, India",
          "M. Tech.",
          "Indian Institute of Information Technology Allahabad, India",
          "B.E.",
          "Shri Vaishnav Institute of Technology &amp; Science, Indore, India (RGPV University)"
        ],
        Experience: [
          "Assistant Professor, Bennett University",
          "Post-doctoral Research Scientist, Institute of Applied Mathematics, Leibniz Universit\u00e4t Hannover, Germany",
          "Graduate Research/Teaching Assistant, Indian Institute of Technology Indore, India",
          "Graduate Research/Teaching Assistant, Indian Institute of Information Technology Allahabad, India"
        ],
        Research: [
          " 1. Numerical Linear Algebra ",
          " 2. Model Order Reduction & Optimization ",
          " 3. Computational Science ",
          " 4. Theory of Computation "
        ],
        Projects: [],
        Distinction: [
          "Reviewer of IEEEAccess",
          "Reviewer of Applied Numerical Mathematics"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rajendra-choudhary/"),
    Faculty_model(
        Name: "Dr. Divya Srivastava",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Divya-Srivastava.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "divya.srivastava@bennett.edu.in",
        About:
            "Ms. Divya Srivastava has completed her M.Tech and Ph. D.  from Department of Computer Science & Engineering, Motilal Nehru National Institute of Technology Allahabad, Prayagraj, India. She has published papers in reputed Journals, National and International Conferences. Her area of interest is image processing, Algorithms, Machine learning, Computer Vision.",
        Education: [
          " Ph.D (2020), Image Processing",
          " Motilal Nehru National Institute of Technology Allahabad, Prayagraj, India ",
          " M.Tech (2016), Software Engineering",
          " Motilal Nehru National Institute of Technology Allahabad, Prayagraj, India (NIT Allahabad) ",
          " B.Tech (2010), Computer Science and Engineering ",
          " Mody Institute of Technology and Science, Lakshmangarh, Rajasthan "
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          " Assistant Professor (Senior Scale), University of Petroleum and Energy Studies, Dehradun ",
          " Lecturer, Vivekanand Institute of Technology, Jaipur "
        ],
        Research: [
          "Computer Vision ",
          "Image Processing ",
          "Algorithms ",
          "Machine Learning  "
        ],
        Projects: [],
        Distinction: [" Invited Speaker Invitation from SCML2019, China. "],
        profile: "https://www.bennett.edu.in/faculties/dr-divya-srivastava/"),
    Faculty_model(
        Name: "Dr. Akash Yadav",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Akash-Yadav310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "akash.yadav@bennett.edu.in",
        About:
            "I am pursuing my PhD from IIT Patna. I earned my M.tech from Pondicherry Central University. My research interests are in computer networks, IoT, crowdsourcing an crowdsensing.",
        Education: [
          " Ph.D (pursuing), Computer science and engineering ",
          " IIT Patna ",
          " M.Tech (2011-2013) , Network and Internet engineering ",
          " Pondicherry Central University ",
          " B.Tech (2007-2011), Computer science and engineering ",
          "GBTU (AKTU)  "
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          " Assistant Professor, KIIT university ",
          " Guest faculty, MNNIT Allahabad "
        ],
        Research: [
          "Approximation Algorithm ",
          "Computer Networks ",
          "Crowdsourcing "
        ],
        Projects: [],
        Distinction: [" IEEE student body member "],
        profile: "https://www.bennett.edu.in/faculties/akash-yadav/"),
    Faculty_model(
        Name: "Dr. Jagendra Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/08/Jagendra-Singh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "jagendra.singh@bennett.edu.in",
        About:
            "Dr. Jagendra Singh is a Ph.D. from Jawaharlal Nehru University(JNU) New Delhi with 10 years of extensive experience in teaching, administration, and management of college and university activities. He had earlier worked with the National Institute of Technology(NIT) Calicut, Kerala. He is an active reviewer of many reputed journals. He also has extensive experience in designing curriculum, developing education pedagogy, and managing industry-institute interaction. He also has an expertise in identifying training needs, designing training modules, and executing the same.",
        Education: [
          " Ph.D. (2015)",
          " JNU, New Delhi, Computer Science and Engineering",
          "M.Tech (2012)",
          " JNU, New Delhi, Computer Science and Engineering"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Associate Professor, Inderprastha Engineering College Ghaziabad",
          " Assistant Professor, National Institute of Technology Calicut (NIT Calicut)"
        ],
        Research: [
          "Natural Language Processing: Information Retrieval System, Recommendation System, Sentiment Analysis",
          "Machine Learning: Deep Learning, Neural Network, Data Analytics"
        ],
        Projects: [],
        Distinction: [
          "Member IEEE ",
          " Member ACM  ",
          " Member Computer Society of India (CSI) ",
          " Member International Association of Engineers (IAENG) ",
          " Member Indian Society for Technical Education (ISTE) ",
          "Conference chair in 3rd International Conference on Advances in Computing and Data Sciences (ICACDS 2019) at Inderprastha Engineering College, Ghaziabad, Uttar Pradesh, India, 12-13 April 2019."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-jagendra-singh/"),
    Faculty_model(
        Name: "Dr. Shashank Sheshar Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/09/Mr-Shashank-S-Singh310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "shashank.singh@bennett.edu.in",
        About:
            "Shashank Sheshar Singh completed his Ph.D. in Computer Science and Engineering from the Indian Institute of Technology (Banaras Hindu University), Varanasi. Prior to that, he completed his masters in Computer Science and Engineering from Indian Institute of Technology, Roorkee. His research interest lies in the domain of Social Network Analysis, Data Mining, and Computational Intelligence.",
        Education: [
          " Ph.D. (2021) ",
          " IIT (Banaras Hindu University), Varanasi ",
          " M.Tech. (2015), Computer Science and Engineering ",
          " Indian Institute of Technology, Roorkee",
          "B.Tech. (2012), Computer Science and Engineering",
          " UPTU, Lucknow"
        ],
        Experience: [" Assistant Professor, Bennett University"],
        Research: [
          "Social Network Analysis (Influence Maximization, Link Prediction, Community Detection)  ",
          "Data Mining (Frequent Pattern Mining, High Utility Itemsets Mining)  ",
          "Computational Intelligence (Nature Inspired Algorithms, Fuzzy-based Systems)  ",
          "Machine Learning  (Classification, Graph Clustering)  "
        ],
        Projects: [],
        Distinction: [
          "Reviewer of ACM Transactions on Management Information Systems, IEEE Transactions on Network Science and Engineering, Applied Soft Computing, IEEE Access, International Journal of Modern Physics, Reviewer of Journal of Ambient Intelligence and Humanized Computing, Social Network Analysis and Mining, etc."
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-shashank-sheshar-singh/"),
    Faculty_model(
        Name: "Dr. Manish Raj",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/08/manish-raj310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "manish.raj@bennett.edu.in",
        About:
            "Dr. Manish has earned his M.Tech & Ph.D. from Department of Robotics and Artificial Intelligence, Indian Institute of Information Technology, Allahabad. His Thesis deals with the Locomotion Control humanoid Robot using Analytical and Machine Learning approaches. He published his research work in various SCI/SCIE/ESCI and Scopus indexed journals and also presented his work in different National & International Conferences which show his research quest. He also served as reviewer of several prestigious and peer reviewed journals. During his tenure at IIIT-Allahabad, he has served as Ph.D. Representative and was involved as an active member in various student committees. He was awarded MHRD fellowship during his M.Tech & Ph.D. He holds the 2nd rank during his M.Tech (Spl: Robotics & AI) studies at IIITA.",
        Education: [
          " Ph.D. (2018)",
          " Indian Institute of Information Technology, Allahabad, Robotics &amp; AI",
          "M.Tech (2013)",
          " Indian Institute of Information Technology, Allahabad, Robotics &amp; AI",
          "B.Tech (2010)",
          " UPTU, EC"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Associate Professor, GLA University, Mathura",
          " Centre for Advanced Studies, AKTU , Lucknow",
          " Assistant Professor, Banasthali Vidyapith, Jaipur"
        ],
        Research: [
          "Robotics & Automation",
          "Artificial Intelligence, Machine Learning ",
          "Control System ",
          " Non Linear Dynamics"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-manish-raj/"),
    Faculty_model(
        Name: "Dr. Gunjan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/08/gunjan310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "gunjan.rehani@bennett.edu.in",
        About:
            "Gunjan is currently pursuing her Ph.D. in Computer Science and Engineering Department from the National Institute of Technology, Delhi, India. She received her Bachelor's in Technology in 2012 from Maharishi Dayanand University, Haryana, India; Masters in Technology from National Institute of Technology, Jalandhar, Punjab, India in 2014. Her research interest lies in the domain of energy-efficient techniques in wireless sensor networks. She is committed to teaching and research and is extremely motivated.",
        Education: [
          " Ph.D. (Pursuing) ",
          " NIT Delhi, Computer Science and Engineering",
          "M.Tech (2014)",
          " NIT Jalandhar, Computer Science and Engineering",
          "B.Tech (2012)  ",
          " MDU, Rohtak,  Information Technology"
        ],
        Experience: [" Assistant Professor, Bennett University"],
        Research: [
          "Wireless Sensor Networks",
          " Adhoc Networks ",
          " Evolutionary Algorithms "
        ],
        Projects: [],
        Distinction: [
          " Received fellowship for Ph.D. Program in Computer Science & Engineering by Ministry of Human Resource & Development, Government of India form August 2015-July 2020."
        ],
        profile: "https://www.bennett.edu.in/faculties/gunjan/"),
    Faculty_model(
        Name: "Dr. Ankur Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/08/Ankur-Gupta310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "ankur.gupta@bennett.edu.in",
        About:
            "Ankur Gupta is currently pursuing Doctor of Philosophy (Ph.D.) in Computer Science and Engineering Department at MNIT Jaipur, India. His research topic is lightweight authentication protocols for wearable devices. His current research interests include Internet of Things, cryptography, access control systems, network security and wireless sensor networks. He has completed his Masters Degree in Computer Science and Engineering from MNNIT Allahabad in 2015.",
        Education: [
          " Ph.D. (Thesis Submitted) ",
          " MNIT Jaipur, Computer Science and Engineering",
          "M.Tech. (2015)",
          " MNNIT Allahabad, Computer Science and Engineering",
          "B.Tech. (2012)  ",
          " KNGD Modi Engineering College, Computer Science and Engineering"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Guest Faculty, IIIT Kota",
          "  Assistant Professor, JECRC University, Jaipur"
        ],
        Research: [
          "Security in IoT",
          "Lightweight Authentication",
          "Cryptography ",
          "Wireless Sensor Networks"
        ],
        Projects: [],
        Distinction: [
          " Received fellowship for Ph.D. Program in Computer Science & Engineering by Ministry of Human Resource & Development, Government of India from 2016-2019. ",
          " Received fellowship for M.Tech. Program in Computer Science & Engineering by Ministry of Human Resource & Development, Government of India from 2013-2015."
        ],
        profile: "https://www.bennett.edu.in/faculties/mr-ankur-gupta/"),
    Faculty_model(
        Name: "Dr. Samya Muhuri",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/08/Samya-Muhuri310x310.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Samya.Muhuri@bennett.edu.in",
        About:
            "Dr. Samya Muhuri did his PhD from the Indian Institute of Engineering Science and Technology, Shibpur (IIESTS) in August 2020. He did his B.Tech. and M.Tech. from West Bengal University of Technology in Computer Science and Engineering in 2012 and 2014, respectively. Prior to joining Bennett, he taught at National Institute of Technology, Sikkim. His research interests focus on Social and Complex Network analysis, Data Mining and Digital Humanity.",
        Education: [
          " Ph.D (2020) ",
          " IIEST, Shibpur, Computer Science and Technology",
          "M.Tech. (2014)",
          " WBUT (currently known as MAKAUT, WB), Computer Science and Engineering",
          "B.Tech. (2012)  ",
          " WBUT (currently known as MAKAUT, WB), Computer Science and Engineering"
        ],
        Experience: [
          " Assistant Professor, Bennett University",
          "  Assistant Professor (Contractual), NIT, Sikkim",
          "  Full Time Research Fellow, IIEST, Shibpur",
          "  Assistant Professor (visiting), RCC Institute of Information Technology, Kolkata"
        ],
        Research: [
          "Social Network Analysis",
          "Data Mining ",
          "Digital Humanity ",
          "Natural Language Processing "
        ],
        Projects: [],
        Distinction: [
          "Ph.D. Institute fellowship (MHRD scholarship) of Indian Institute of Engineering Science & Technology, Shibpur from 1st August, 2015-13th January, 2020. ",
          "GATE scholarship from All India Council for Technical Education (AICTE) for M.Tech. study (from July, 2012- June, 2014).",
          "International Travel Support (ITS) from Science and Engineering Research Board (SERB), Government of India and IEEE International Conference on Data Mining (ICDM) committee for Travel in Singapore for IEEE International Conference on Data Mining (ICDM), 2018."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-samya-muhuri/"),
    Faculty_model(
        Name: "Dr.  Simranjit Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/02/Simranjit-Singh-School-of-Engineering-and-Applied-Science.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "simranjit.singh@bennett.edu.in",
        About:
            "Simranjit Singh has more than 4 years of experience in research. He has developed various deep learning framework for classification of Hyperspectral data. He also developed a quantification framework to quantify the various soil attributes. He is highly motivated for teaching and research.",
        Education: [
          "  Ph.D. (2020)",
          " Computer Science and Engineering, Thapar Institute of Engineering and Technology, Patiala",
          " M.Tech (2015)",
          " Computer Engineering, University College of Engineering, Punjabi University, Patiala",
          " B.Tech (2013)",
          " Computer Science and Engineering, Desh Bhagat Engineering College, Mandi Gobindgarh"
        ],
        Experience: [
          "  Assistant Professor, Bennett University",
          " Assistant Professor, Chitkara University"
        ],
        Research: [
          "Hyperspectral Images ",
          "Deep learning ",
          "Machine learning ",
          "Edge Detection "
        ],
        Projects: [],
        Distinction: [
          "Ranked in Top 21% in National IT Aptitude Test in 2012",
          "UGC-Net 2019 Qualified (Percentile- 98.6671016)",
          "UGC-Net 2018 Qualified (Percentile-99.1435)",
          " GATE 2019 Qualified",
          "Associate member IETE since April 2015"
        ],
        profile: "https://www.bennett.edu.in/faculties/simranjit-singh/"),
    Faculty_model(
        Name: "Dr. Mohit Sajwan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2020/02/Mohit-Sajwan.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "mohit.sajwan@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D. degree awarded in 25th January 2021 ",
          " Computer Science &amp; Engineering, National Institute of technology Delhi, India ",
          " M.E(2015) ",
          " Computer Science &amp; Engineering, Birla Institute of technology, Mesra, India ",
          "B.Tech(2012) ",
          " Computer Science and Engineering, Amrapali Institute of Technology and Sciences, Haldwani, India "
        ],
        Experience: [
          "  Assistant Professor, Bennett University ",
          "  Assistant Professor, College of Technology, GBPUA&T Pantnagar, India ",
          "  Assistant Professor, Samrat Ashok Technological Institute, Vidisha, India "
        ],
        Research: [
          "Wireless Sensor Network ",
          "Wireless Adhoc Networks ",
          "Image Processing ",
          " Anonymity"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-mohit-sajwan/"),
    Faculty_model(
        Name: "Dr. Suchi Kumari",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/08/MS-SUCHI-KUMARI-AssistantProfessor.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "suchi.kumari@bennett.edu.in",
        About: "null",
        Education: [
          " Ph.D., Computer Science Engineering(Thesis Submitted in June 2019)",
          "  National Institute of Technology Delhi, India",
          " M. Tech (2014) Computer Science Engineering",
          "  Indian Institute of Information Technology Design &amp; Manufacturing Jabalpur, India ",
          " B. Tech (2012) Computer Science Engineering",
          " Integral University Lucknow, India "
        ],
        Experience: [
          "Assistant Professor Bennett University, Greater Noida, India "
        ],
        Research: [
          " Network Science",
          " Communication System",
          " Complex System"
        ],
        Projects: [],
        Distinction: [
          " ACM Transactions on Internet Technology ",
          "Computer Communications- Elsevier",
          "Editorial Board Member: Electrical Science & Engineering journal"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-suchi-kumari/"),
    Faculty_model(
        Name: "Dr. Shashidhara",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/09/DrShashidhara-School-of-Engineering-and-Applied-Sciences-1.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "shashidhar@bennett.edu.in",
        About: "null",
        Education: [
          "   PhD (2019), Network Security ",
          " National Institute of Technology Karnataka, Surathkal ",
          "M.Tech (2013), Communication and Networking",
          " Visvesvaraya Technological University Belgaum, Karnataka",
          " B.Tech (2009), Information Science & Engineering ",
          " Visvesvaraya Technological University Belgaum, Karnataka"
        ],
        Experience: [
          " Assistant Professor, Bennett University ",
          " Senior Assistant Professor, MITS-Madanapalle, AP ",
          " aLecturer, NIT Surathkal ",
          " Assistant Professor, KNSIT-Bangalore "
        ],
        Research: [
          " Design of Secure Authentication Protocols for Roaming Service in Mobility Environments. ",
          " Cross-site scripting (XSS) Attacks ",
          " Security in IoT",
          " Blockchain Technology "
        ],
        Projects: [],
        Distinction: [
          " Reviewer of the following journals: IET Information Security, Journal of Information Security and Applications (Elsevier), Wireless Networks (Springer).",
          "Best paper award in the 6th International Conference on Communication and Network Security (ICCNS-2016), Singapore for the paper entitled An efficient and secure authentication scheme with user anonymity for roaming service in global mobile networks. ",
          "Certificate of merit for securing 1st position in the 1st year of M.Tech at P A College of Engineering, Mangalore."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-shashidhara/"),
    Faculty_model(
        Name: "Dr. Tanmay Bhowmik",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/02/Dr.-Tanmay-Bhowmik-1.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "tanmay.bhowmik@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2017) Speech Recognition",
          " Indian Institute of Technology Kharagpur ",
          "M.Tech. (2009) Information Technology",
          " Jadavpur University ",
          "BE.(Hons.)(2004) Information Technology",
          " MCKV Institute of Engineering "
        ],
        Experience: [
          " Assistant Professor at Bennett University, India ",
          " Assistant Professor (Selection Grade) at University of Petroleum and Energy Studies, Dehradun, India ",
          " Senior Lecturer at Murshidabad College of Engineering and Technology, West Bengal, India ",
          " Lecturer at Murshidabad College of Engineering and Technology, West Bengal, India ",
          " Network Support Engineer at Tripod Computing Services Pvt. Ltd., Kolkata, India "
        ],
        Research: [
          " 1. Automatic Speech Recognition",
          "2. Attribute based Speech Recognition ",
          "3. Speech Prosody, Prosodic Word Boundary Detection",
          "4. Development of speech corpora for less-resourced languages"
        ],
        Projects: [],
        Distinction: [
          "Recipient of MHRD Research Fellowship from Indian Institute of Technology Kharagpur.",
          "Recipient of Travel Bursary Award in IconSIP  2016, jointly organized by IIT Bombay, COE Pune, SGGS Nanded."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-tanmay-bhowmik/"),
    Faculty_model(
        Name: "Dr. Shakti Sharma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/02/Dr.-Shakti-Sharma.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Shakti.sharma1@bennett.edu.in",
        About: "null",
        Education: [
          "M.Tech. + Ph.D. (2019) Evolutionary Algorithms for Satellite Image Analysis",
          " Indian Institute of Technology Bombay ",
          "B.Tech. (2011) Information Technology",
          " Noida Institute of Engineering and Technology, Greater Noida "
        ],
        Experience: [
          " Assistant Professor at Bennett University, India ",
          " Junior Research Fellow at Indian Institute of Technology Bombay "
        ],
        Research: [
          " 1. Evolutionary Algorithms ",
          " 2. Satellite Image Analysis ",
          " 3. Domain Adaptation ",
          " 4. Spatial-Spectral Classification "
        ],
        Projects: [],
        Distinction: [
          "Recipient of MHRD Research Fellowship from Indian Institute of Technology Bombay.",
          " GRSS travel award in IGARSS  2014 and IGARSS-2018. ",
          " Mr. Post Graduate 2012, IIT Bombay. "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-shakti-sharma/"),
    Faculty_model(
        Name: "Dr. Indrajeet Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2019/01/Mr.-Indrajeet-Gupta.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "indrajeet.gupta@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D.(2019)",
          "Computer Science Engineering, Indian Institute of Technology (ISM), Dhanbad, India ",
          "M. Tech (2012)",
          "Computer Science Engineering, National Institute of Technology, Rourkela, Odisha, India ",
          "B. Tech (2010)",
          "Information Technology, United College of Engineering &amp; Research, Allahabad, India "
        ],
        Experience: [
          "Assistant Professor, Department of Computer Science Engineering, School of Engineering & Applied Sciences , Bennett University ",
          "Assistant Professor, S. R. Group of Institutions, Jhansi, India ",
          "Assistant Professor, Sri Ramswaroop Memorial College of Engineering and Management, Lucknow, India "
        ],
        Research: [
          " 1. Cloud Computing ",
          " 2. Workflow/Task Scheduling and Resource Allocation ",
          " 3. Distributed Systems"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-indrajeet-gupta/"),
    Faculty_model(
        Name: "Dr. Tapas Badal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/12/Dr.-Tapas-Badal.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "tapas.badal@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2018)",
          "Computer Science &amp; Engineering, MNIT Jaipur, India",
          "M. Tech (2009)",
          "Advance Networks, ABV-IIITM Gwalior, India",
          "B.E. (2006)",
          "Computer Science and Engineering, IES-IPS Academy Indore, India"
        ],
        Experience: [
          "Assistant Professor, Bennett University, India ",
          "Associate Professor, SKIT Jaipur, India ",
          "Associate Professor, COER Roorkee, India ",
          "Associate Professor, SSITM Bhilai, India "
        ],
        Research: [
          "Activity Analysis in surveillance videos ",
          "Image Processing and Pattern Recognition",
          "AI & Machine Learning"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-tapas-badal/"),
    Faculty_model(
        Name: "Dr. Kuldeep",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/12/Dr.-Kuldeep.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "kuldeep@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2018)",
          "Geomatics, IIT, Roorkee, India",
          "M. Tech (2012)",
          "Remote Sensing and GIS, Maulana Azad National Institute of Technology, Bhopal, India",
          "B. Tech (2009)",
          "Computer Science and Engineering, Institution of Engineering and Rural Technology, Allahabad (India)"
        ],
        Experience: [
          "Assistant Professor, Bennett University, India ",
          "Research Scientist, National Remote Sensing Centre/ISRO, Department of Space, Hyderabad, India"
        ],
        Research: [
          "Applications of Space Technology for Object Extraction, Land and Water Resource Planning",
          "Digital Image Processing, Computer Networks, Operating System",
          "Machine Learning and Deep Learning",
          "Geographical Information System, Remote Sensing, Digital Photogrammetry"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-kuldeep/"),
    Faculty_model(
        Name: "Dr. Madhushi Verma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/52_Dr.-Madhushi-Verma-Assistant-Professor-.png",
        Designation: "Assistant Professor ",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "madhushi.verma@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2016)",
          " IIT (BHU) Computer Science and Engineering ",
          "BE (Hons) (2009)",
          "Rajasthan University Computer Science and Engineering "
        ],
        Experience: [
          "Asst. Professor : Bennett University School of Engineering & Applied Sciences June",
          "Assistant Professor (SG) University of Petroleum and Energy Studies School of Computer Science and Engineering ",
          "Sr. Lecturer Vivekananda Institute of Technology Department of Computer Science and Engineering",
          "Lecturer Baldev Ram Mirdha Institute of Technology Department of Computer Science and Engineerin"
        ],
        Research: [" Fuzzy Logic,", "Heuristics,", "Artificial Intelligence."],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-madhushi-verma/"),
    Faculty_model(
        Name: "Dr. Tanveer Ahmed",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/Tanveer-Ahemad.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "tanveer.ahmed@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Indian Institute of Technology, Indore",
          "M.Tech in Computer Science & Engineering",
          "GGSIPU ",
          "B.Tech in Computer Science & Engineering",
          "GGSIPU"
        ],
        Experience: [],
        Research: [
          "Machine Learning",
          "Data Analytics",
          "Cyber Physical Systems",
          "Man-Machine Systems",
          "Stochastic Systems",
          "Application of Machine Learning in Psychology"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-tanveer-ahmad/"),
    Faculty_model(
        Name: "Dr. Sridhar Swaminathan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/shridhar-swaminathan.jpg",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "sridhar.swaminathan@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. CS 2015",
          "Bharathidasan University, Trichy",
          "M.Sc. CS 2012",
          "Bishop Heber College, Trichy, India ",
          "B.Sc. CS 2010",
          "Bishop Heber College, Trichy, India "
        ],
        Experience: [
          "Bennett University, Department of Computer Science and Engineering, School of Engineering & Applied Sciences",
          "Research officer, Multimedia University, Malaysia "
        ],
        Research: [
          "Computer Vision,",
          "Information Retrieval,",
          "Machine Learning"
        ],
        Projects: [
          "\"A Real Time Multilingual Customer Sentiment Mining (Telekom Domain)\", Multimedia University, Malaysia, Funded by Telekom Malaysia, (September 2015  November 2016)",
          "\"SMS Sentiment Mining Application (TELSENSE 2.0 - SMS)\", Multimedia University, Malaysia, Funded by Telekom Malaysia, (January 2017  May 2017)"
        ],
        Distinction: [],
        profile:
            "https://www.bennett.edu.in/faculties/dr-sridhar-swaminathan/"),
    Faculty_model(
        Name: "Dr. Vipul Kumar Mishra",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/24_Dr.-Vipul-Kumar-Mishra-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "Members (Academic Council)",
        Email: "vipul.mishra@bennett.edu.in",
        About:
            "Dr. Vipul Kumar Mishra is a PostDoc Scholar from University of Kentucky, USA, Doctor of Philosophy (Ph.D) Computer Science and Engineering from Indian Institute of Technology, Indore, M.E. and B.E. in Computer Science Engineering. His research areas include High Level Synthesis, Reversible Logic Synthesis, Emerging Technologies, Optimization in VLSI Design and Swarm Optimzation.",
        Education: [
          "PhD (2015)",
          "Indian-Institute of Technology (IIT) INDORE Computer Science and Engineering",
          "ME (2011)",
          "SGSITS Indore Computer Engineering",
          "BE (2009)",
          "RGPV Bhopal Computer Science and Engineering"
        ],
        Experience: [
          "Post Doctoral Scholar University of Kentucky USA",
          "Teaching Assistant Indian Institute of Technology (IIT) INDORE",
          "Lecturer SGSITS Indore"
        ],
        Research: [
          "Optimization in EDA",
          "Internet of Things",
          "CAD for VLSI and Nanotechnologies",
          "Emerging Technologies",
          "Swarm Optimization",
          "Nature Inspired Optimization Algorithm"
        ],
        Projects: [],
        Distinction: [
          " IEEE Transaction of VLSI",
          "IEEE Transaction on Aerospace and Electronic Systems",
          "IEEE/IET Journal on Computers & Digital Techniques",
          "Microelectronics Journal Elsevier",
          "INIS 2017",
          "ICTIEE 2018",
          "ICTIEE 2018"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-vipul-kumar-mishra/"),
    Faculty_model(
        Name: "Dr. Suneet Kumar Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/09/Suneet-Gupta.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Suneet.gupta@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2016)",
          "Indian Institute of Technology (IIT) Dhanbad Computer Science and Engineering ",
          "MTech (2011)",
          "Rajiv Gandhi Proudyogiki Vishwavidyalaya, Bhopal Computer Science and Engineering",
          "BE (2002)",
          "Dehradun Institute of Technology, Dehradun Computer Science and Engineering "
        ],
        Experience: [
          "Associate Professor : Bennett University School of Engineering & Applied Sciences June",
          "Associate Professor: ABES Engg. College, Ghaziabad",
          "Asst. Professor (sr. grade) O P Jindal Institute of Technology, Raigarh",
          "Junior Research Fellow Indian School of Mines, Dhanbad"
        ],
        Research: [
          "Wireless Sensor Networks.",
          "Natural Languages Processing.",
          "Internet of Things."
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-suneet-kumar-gupta/"),
    Faculty_model(
        Name: "Dr. Anurag Goswami",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/09/22_Dr.-Anurag-Goswami-Assistant-Professor.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "anurag.goswami@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2017)",
          "Software Engineering, North Dakota State University, USA",
          " ",
          "MSP (2009)",
          "Advanced Software Technologies, International Institute of Information Technology, Pune",
          "BE (2007)",
          "Information Technology, Rishiraj Institute of Technology, Indore"
        ],
        Experience: [
          "Associate Professor : Bennett University School of Engineering & Applied Sciences",
          "Research Assistant : North Dakota State University, USA",
          "Teaching Assistant : North Dakota State University, USA",
          "Graduate Student Instructor : North Dakota State University, USA",
          "Software Developer (Capstone Project) : National Information Solutions Cooperative (NISC), USA",
          "Graduate Assistant : North Dakota State University, USA"
        ],
        Research: [
          " 1. Empirical Software Engineering",
          " 2. Requirements Engineering and Software Quality",
          " 3. Software Inspections",
          " 4. Cognitive Psychology in Software Engineering",
          "5. Software Engineering Education"
        ],
        Projects: [
          "1. 2017 - Graduate Teaching Award Nominee: College of Science and Mathematics, NDSU",
          "2. 2016 - Rahul Devabhaktuni Graduate Scholarship: Computer Science, NDSU",
          "3. 2016 - IEEE Best Industry Paper Award Nominee: ISSRE",
          "4. 2015 - Travel Award: College of Science and Mathematics, NDSU",
          "5. 2013 - IEEE Best Research Paper Award: ISSRE",
          "6. 2013 - NSF Travel Award",
          "7. 2001 - Silver Merit: National Cyber Olympiad",
          "1. Characterizing Reading Patterns of Software Inspectors Using Eye-Tracking System.",
          "2. WReSTT-CyLE  Web-based Repository of Software Testing Tutorials.",
          "3. Improving Fault Detection Effectiveness of Inspectors Using Learning Styles."
        ],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-anurag-goswami/"),
    Faculty_model(
        Name: "Dr. Shivani Goel",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/29_Dr.-Shivani-Goel-Professor.jpg",
        Designation: "Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "Members (Academic Council)",
        Email: "shivani.goel@bennett.edu.in",
        About:
            "Dr. Shivani Goel is a Ph.D. from Thapar University with 16 years of extensive experience in teaching, administration and management of college activities. She has an experience of facilitating/coaching students by using interactive discussions and hands-on approaches to help students learn and apply concepts in subjects. She also has an expertise in identifying training needs, designing training modules and executing the same. ",
        Education: [
          "PhD",
          " Computer Science and Engineering, Thapar University, Patiala ",
          "ME",
          "Software Engineering, Thapar University, Patiala ",
          "BE",
          "Computer Science and Engineering, Thapar University, Patiala "
        ],
        Experience: [
          "Professor - Department of Computer Science and Engineering Bennett University,",
          " Served at Different Faculty Positions in Thapar University for 16 Years"
        ],
        Research: [
          "Software reuse, Algorithms, Artificial Intelligence",
          "Machine learning"
        ],
        Projects: [
          "Innovative research in pedagogy for Mini-MOOCs blended with instruction strategies to enhance quality of Higher Education) under Role of Lead Zonal Institutions in Newton Bhabha Project (Royal Academy of Engineering and FICCI, India)",
          "2 years (March 2016 to December 2017)",
          "\u00a3100,000.00",
          "Royal Society of Engineering, UK",
          "March 2016 to Dec 2017"
        ],
        Distinction: [
          "Chair, ACM-W chapter at Computer Science and Engineering Department, Thapar University,Patiala ",
          "Member IEEE, USA",
          "Member ACM, UK ",
          "Member AAAI, USA"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-shivani-goel/"),
    Faculty_model(
        Name: "Dr. Prabhakar Sathujoda",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2018/10/Prabhakar-Sathujoda310x310.png",
        Designation: "Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "null",
        Email: "Prabhakar.Sathujoda@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (2002)",
          "Mechanical Engineering, IIT, Kharagpur, India",
          "M. Tech (1995)",
          "Maintenance Engineering, University of Mysore, India",
          "AMIE (1991)",
          "Mechanical Engineering, Institution of Engineers, Calcutta (India)"
        ],
        Experience: [
          "Professor, Bennett University, India",
          "Rolls Royce, UK ; Bladonjets, UK ; AAF UK ; P&G UK ",
          "Professor - Madanapalle Institute of Technology & Science, India",
          "Team Leader (Mechanical Structural Design), AAF International Ltd, UK",
          "Senior Stress Engineer, ALSTOM (ITP), UK",
          "Post-doctoral Fellow, University of Bath, UK",
          "Engineer, GE Aircraft Engines, India",
          "Lecturer, Arunai Engineering College, TN & Other AMIE institutes, India"
        ],
        Research: [
          "Application of finite element analysis to aerospace and mechanical structural problems ",
          "Rotordynamics and vibration analysis ",
          "Fatigue, fracture and damage tolerance in the mechanical & aerospace domain",
          "Natural fibre composites"
        ],
        Projects: [],
        Distinction: [
          " Prestigious Rolls-Royce (UK) Stress Signatory Award (2018) for XWB Intermediate Pressure and Trent 900 High Pressure Turbine Blades for TBF Q-Bond Surgeries. ",
          "Prestigious Rolls-Royce (UK) Stress Signatory Award (2017) for Trent 700 and Trent 800 High Pressure Turbine Blades for TBF Q-Bond Surgeries ",
          " Patent (2019) - SYSTEMS AND METHODS FOR MONITORING THE HEALTH OF MULTI-CELL BATTERIES (Filed and Published  International Publication Number WO2019/145976 A1) ",
          " Patent (2019) - COST-EFFECTIVE AND HIGH-PERFORMANCE MID-DRIVE UNIT FOR ELECTRIC BYCYCLE (Filed and Published  Application Number 201741041965) ",
          "AAF International Ltd, UK Approved Consultant Status Award (2019) for Structural Design and Analysis of Gas Turbine Inlet and Exhaust Systems ",
          "First Prize for seed grant project in Engineering Project Showcase (2019) organised by Bennett University, India ",
          "Industry Invited Talk on Fatigue Analysis of an NHance Gas Turbine Filter parts under FPSO loading conditions at AAF International UK (2018) ",
          "Best Project Award (2007) received at ALSTOM, UK in recognition for Rolls Royce and GEnx Inlet Lip Skin Fatigue Analysis ",
          "Best Project Award (2007) received at ALSTOM, UK in recognition for Rolls Royce and GEnx LCF methodology of GEnx and RR Exhaust Nozzle and Centrebody ",
          "IFToMM Rotor Dynamics Technical Committee Best Paper Prize (2006) for paper of outstanding quality presented at the IFToMM Conference on Rotor Dynamics, Vienna, awarded by IFToMM Rotor Dynamics Technical Committee ",
          "Post-Doctoral Research Award (Apr 2004  Jan 2006) for Development of Wavelet-H-infinity based controller for rotor vibration control from University of Bath, UK ",
          "Research fellowship received from Ministry of Human Resources Department, India for PhD study (Feb 1999 -Jan 2002) ",
          "GATE scholarship received from Ministry of Human Resources Department, India for Postgraduate study (Aug 1993- May 1995) ",
          "Merit Scholarship received from Government of Andhra Pradesh for Senior Secondary Education (1985  1987) "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-p-sathujoda/"),
    Faculty_model(
        Name: "Dr. Sarika Goyal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/Sarika-Goyal.jpg",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Mathematics",
        Position: "null",
        Email: "sarika.goyal@bennett.edu.in",
        About:
            "Dr. Sarika Goyal is faculty in Department of Mathematics. She did Doctor of Philosophy (Ph.D) from Department of Mathematics, Indian Institute of Technology Delhi, India and Master of Philosophy(M-Phil.) from Department of Mathematics, Delhi University. Her research interests include Analysis And Partial Differential Equations. ",
        Education: [
          "Post-Doctoral - Indian Institute of Technology (IIT) Delhi - Non Local Elliptic PDE ",
          "PhD (Jan 2015)",
          "Indian Institute of Technology (IIT) Delhi - Analysis of Elliptic PDE ",
          "M-Phil(2011)",
          "Delhi University , Delhi - (Mathematics) ",
          "M.A (2009)",
          "Hindu College, Delhi University, Delhi - Mathematics ",
          "B.A(Hons) (2007)",
          "Lakshmi Bai College, Delhi University, Delhi - Mathematics "
        ],
        Experience: [
          "Associate Professor - Bennett University School of Engineering & Applied Sciences 2016"
        ],
        Research: [
          " 1.Variation Methods.",
          " 2. Non Local Elliptic Partial Differential Equations.",
          "3.Partial Differential Equations of Elliptic Type."
        ],
        Projects: [],
        Distinction: [
          "2015 - Awarded NBHM Post- Doctoral Fellowship ",
          "2009 - Awarded Council for Scientific and Industrial Research (CSIR-UGC) Junior Research Fellowship(JRF), December 2009."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-sarika-goyalmittal/"),
    Faculty_model(
        Name: "Dr. Krishna Thyagarajan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/11/21_Dr.-Krishna-Thyagarajan-Professor.jpg",
        Designation: "HOD & Professor Department of Physics",
        School: "School of Engineering and Applied Sciences",
        Department: "Physics",
        Position: "null",
        Email: "krishna.thyagarajan@bennett.edu.in",
        About: "null",
        Education: [
          "Ph. D. Physics (1976)",
          " Indian Institute of Technology(IIT), Delhi",
          "M. Sc. Physics (1973)",
          "University of Delhi, Delhi ",
          "B. Sc. (Hons) Physics (1971)",
          " University of Delhi, Delhi"
        ],
        Experience: [
          "Professor,Department of Physics, Bennett University",
          "Officiating Director IIT, Delhi ",
          "Head, Department of Physics Indian Institute of Technology, Delhi",
          "Coordinator,Interdisciplinary M Tech. &Research program on Optoelectronics and Optical Communications Indian Institute of Technology, Delhi"
        ],
        Research: [
          "1 Guided wave quantum optics",
          "2.Nonlinear effects in optical waveguides",
          "3.Optical fiber amplifiers and optical waveguide gratings"
        ],
        Projects: ["Reasearch Work", "Great Practioner of Science"],
        Distinction: [
          "Excellence in Teaching award by IIT Delhi in 2011",
          " ",
          " Elected Fellow of the Indian National Academy of Engineering in 2008",
          " ",
          "Elected Fellow of the Optical Society of America in 2005 ",
          " ",
          "Decorated with the title of Officier dans lordre des Palmes Acadmiques by the French Government. in 2003",
          " ",
          "Co-recipient of the \"Fiber Optic Person of the Year 1997 award by Lucent Technologies- Finolex and Voice and Data, India in 1998.",
          " ",
          "Chairman, Working Group on Photonics of the Department of Information Technology of the Ministry of Communication and Information Technology (MCIT), Government of India (2009- 2015)",
          " ",
          "Honorary Editor of IETE Journal of Research in the area of Optoelectronics",
          " ",
          "Member, Programme Advisory Committee (PAC) on Lasers, Optics, Atomic and Molecular Physics of the Department of Science and Technology in Physical Sciences under Science and Engineering Research Council (SERC): 2007-2010",
          " ",
          "Member, Board of studies of School of Physical Sciences, Jawaharlal Nehru University, 2016",
          " ",
          " Co-authored (with Professor Ajoy Ghatak) ten books in the area of Optics, Fiber Optics, Lasers and Optical Electronics"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-krishna-thyagarajan/"),
    Faculty_model(
        Name: "Dr. Vinayak Ranjan",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2017/08/46_Dr.-Vinayak-Ranjan-HOD-_-Professor.jpg",
        Designation:
            "HOD & Professor Department of Mechanical and Aerospace Engineering",
        School: "School of Engineering and Applied Sciences",
        Department: "Mechanical and Aerospace Engineering",
        Position: "Professor and Head",
        Email: "Vinayak.ranjan@bennett.edu.in",
        About: "null",
        Education: [
          "PhD (2006)",
          "Indian Institute of Technology (BHU) Varanasi, India - Mechanical Engineering ",
          "B.Sc. (Engg.) (1991)",
          "Bihar University - Mechanical Engineering"
        ],
        Experience: [
          "Professor and Head - Department of Mechanical Engineering, Bennett University, Greater Noida, NCR Delhi , India",
          "Associate Professor - Indian Institute of Technology (ISM) Dhanbad, India",
          "Assistant Professor - Indian Institute of Technology (ISM) Dhanbad, India",
          "Senior FEA Analyst - Caterpillar Engineering Design Centre, Chennai",
          "Senior Scientist - ICAR-NIRJAFT, Kolkata, India",
          "Scientist - ICAR-NIRJAFT, Kolkata, India 1994-2006"
        ],
        Research: [
          " 1. Vibro-acoustic-piezoelectric energy harvesting with plate structures",
          " 2. Dynamic interaction of the wheel rail contact",
          " 3. Structural analysis with finite element method, dynamic stiffness method, Rayleigh Ritz method",
          " 4. Mechanics of knee prosthesis Design",
          "5. Design of flame proof apparatus for mines"
        ],
        Projects: [
          "Training project On Energy for Sustainable Development for the students of University of South Florida, St. Petersburg, USA during 23 July, - 05 August, 2018 (19500 USD).",
          "2.Fatigue Analysis of the NHance Filter Clip Retainer and Holder parts, AAF International, UK, 2018 (GBP 5900.00).",
          "3.Design and Development of Test Rig for High Strain Rate Characterization of Materials for Dynamic Applications, 2018 (INR 15 lakhs, approx. 21000 US), Seed grant, BU, India",
          "4. Vibration and stability analysis of spinning thin plates. UGC, New Delhi, (2011  2014).",
          "5. Design and development of MEMS based piezo acoustic sensor for energy harvesting, FRS project, IIT(ISM) Dhanbad (2010 - 2014). .",
          "6. Application of Dynamic Stiffness Method on Free vibration analysis of levy plate Erasmus Mundus AREAS+ program at City University London, UK (June- July 2015.",
          "7. Design of PZT membrane for vibration energy harvesting at the Acoustics transducers Lab, University of South Florida, USA (June-July, 2012)"
        ],
        Distinction: [
          "2019: Invited Key note speaker, Vinayak Ranjan on Manufacturing enters a new dimension: 3D Printing, Two Day Workshop on 3D Printing and Its Application in Industry, Research and Academics, Gautam Buddha University, Greater Noida, 25-26 February, 2019.",
          "2018: Member, Editorial Board, Journal of Vibroengineering, indexed in web of Science Clarivate Analytics since 2018",
          "2015: Railway Boards second prize for the paper on Contact stress analysis of wheels-rail by Hertzian method and finite element method published in the journal of Institution of Engineers (India): series C, Vol 95, 2014",
          " 2015: Visiting Researcher at City University of London",
          " 2012: Invited Talk on Piezoelectricity and its Applications at St. Petersburg Campus, University of South Florida, USA and GELS International Symposium at the University of South Florida, St Petersburg.",
          " 2012: Visiting Researcher at University of South Florida, USA"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-vinayak-ranjan/"),
    Faculty_model(
        Name: "Dr. Anika Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Dr-Anika310x310.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "anika.gupta@bennett.edu.in",
        About:
            "Anika has earlier worked as a software engineer at IBM India Pvt. Ltd., Bangalore, and as faculty at TIET, Patiala. Her research areas includemachine learning, deep learning, advanced algorithms, and their usage preferably in the field of education.",
        Education: [
          "Ph.D + M.E. (2019) Computer Science and Engineering ",
          " Thapar Institute of Engineering and Technology (TIET), Patiala",
          "B.Tech Computer Science and Engineering",
          " Meerut Institute of Engineering and Technology, Meerut"
        ],
        Experience: [
          " Assistant Professor at Bennett University, India ",
          "Assistant Professor (Contractual) at Thapar Institute of Engineering and Technology, Patiala",
          "Software Engineer at IBM India Pvt. Ltd., Bangalore"
        ],
        Research: [
          " 1. Educational Data Science ",
          " 2. Learning Analytics ",
          " 3. Adaptive Learning Systems ",
          " 4. Recommender Systems "
        ],
        Projects: [],
        Distinction: [
          "Mentor of Winning Team (Technoturners) of Smart India Hackathon (Software Edition) 2020, under Airport Authority of India (AAI), India.",
          "Mentor of Winning Team (AlphaQ) of Smart India Hackathon 2019, under complex problems of Supply Chain, Hindustan Unilever Limited, India.",
          "Best Research Paper Award for the Research Paper Applying data mining techniques for generating MOOCs recommendations on the basis of learners online activity in IEEE 6th International Conference on MOOCs, Innovation and Technology in Education, (MITE-2018, November).",
          "Mentor of 2nd Runner Up Team (Cratif Pixel) of Smart India Hackathon 2017, under Ministry of Commerce, Department of Industry Policy and Promotion, Government of India."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-anika-gupta/"),
    Faculty_model(
        Name: "Dr. Deepika Pantola",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Dr-Deepika-PantolaB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "deepika.pantola@bennett.edu.in",
        About:
            "Deepika is a post-doctoral Research Scholar at the University School of Information and Communication Technology (USICT), Guru Gobind Singh Indraprasth University, New Delhi. Earlier, she completed  M.Tech. (in CSE) from USICT, Guru Gobind Singh Indraprasth University, New Delhi in 2013. She qualifies UGC-Net in CS in 2012. Also, she qualified for GATE in 2010  and 2011. She worked in the field of Machine learning, Deep learning, Computer Vision, and Data Mining. Not only has she worked in the above scientific fields, but she has also deep knowledge in all these fields.",
        Education: [
          "Ph.D. + M.Tech Computer Science and Engineering",
          "USICT, Guru Gobind Singh Indraprasth University, New Delhi (GGSIU, New Delhi) ",
          "M.C.A Computer Applications",
          "Indira Gandhi National Open University, New Delhi",
          "B.C.A Computer Applications",
          "Dr B.R. Ambedkar University, Agra"
        ],
        Experience: [
          " Assistant Professor at Bennett University, India ",
          " Project Engineer at CDAC Noida ",
          " Assistant Professor at CCSIT, Teerthanker Mahaveer University, Moradabad",
          " Lecturer at CCSIT, Teerthanker Mahaveer University, Moradabad ",
          " Lecturer at Khandelwal College Bareilly "
        ],
        Research: [
          " 1. Data Mining ",
          " 2. Machine Learning ",
          " 3. Deep Learning ",
          " 4. Computer Vision"
        ],
        Projects: [],
        Distinction: ["Reviewer of Taylor and Francis Journal"],
        profile: "https://www.bennett.edu.in/faculties/dr-deepika-pantola/"),
    Faculty_model(
        Name: "Dr. Aditya Bhardwaj",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Aditya-Bhardwaj-v2.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "aditya.bhardwaj@bennett.edu.in",
        About:
            "Dr. Aditya Bhardwaj has completed his B.Tech in CSE from Gautam Buddh Technical University Lucknow and Master of Engineering (M.E), Ph.D. in CSE from NITTTR (Central Govt Institute), Chandigarh. He has more than 3 years of teaching experience and participated in a number of national, international conferences. He has a specialization in  Cloud Computing virtualization, Big Data Analytics and also started working on Blockchain Technology.  He has published more than 10 research papers in reputed SCI-E, Scopus indexed international journals and conferences.",
        Education: [
          "Ph.D. (August -2020) Cloud Computing Virtualization",
          "NITTTR Chandigarh, India",
          "Master of Engineering (M.E) (December-2015) Computer Science & Engineering",
          "NITTTR Chandigarh, India",
          "B.Tech (July-2011) Computer Science & Engineering",
          "Gautam Buddh Technical University - GBTU, Lucknow, India"
        ],
        Experience: [
          " Assistant Professor at Bennett University, India ",
          " Assistant Professor (Research Faculty) at KIET Group of Institutions, Ghaziabad ",
          " Contractual Faculty at PEC (Deemed to be University), Chandigarh ",
          " Lecturer at BDS Institute of Mgmt.,(AKTU, Lucknow)"
        ],
        Research: [
          " 1. Cloud Computing Virtualization",
          " 2. Big Data Analytics ",
          " 3. Blockchain Technology "
        ],
        Projects: [],
        Distinction: [
          "Qualified GATE 2015, 2017 and UGC NET for Assistant Professor Dec-2018.",
          "Certified by IBM Career Education Program for cloud computing career education program. ",
          "Co-coordinated AICTE ATAL FDP on Data Science and Machine Learning, 17-21 November 2020.",
          "Received 15+ appreciation certificates for delivering expert lectures in one week Faculty Development Program organized by  NITTTR, Chandigarh.",
          "Associated as reviewer for the referred International journals like IEEE Transaction on Cloud Computing and International Conferences.",
          "Associated as reviewer for the referred International journals like IEEE Transaction on Cloud Computing and International Conferences.",
          "Associated as technical writer for Open Source for You (OSFY) Magazine- An Asia's leading IT publication. "
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-aditya-bhardwaj/"),
    Faculty_model(
        Name: "Dr. Akansha Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Akanksha-Singh-v2.png",
        Designation: "Associate Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "akansha1.singh@bennett.edu.in",
        About:
            "Dr. Akansha Singh is B.Tech, M.Tech, and Ph.D. in Computer Science. She received her Ph.D. from IIT Roorkee in image processing and machine learning. She has to her credit more than 70 research papers, 20 books, and numerous conference papers. She has also national and International Patents in the field of machine learning. She has been the editor for books on emerging topics with publishers like Elsevier, Taylor and Francis, Wiley, etc. Dr. Singh has served as a reviewer and technical committee member for multiple conferences and journals of High Repute. She is also the Associate Editor for IEEE Access journal, Guest editor for journals like Complex & Intelligent Systems, Journal of Real-Time Image processing, etc. Dr. Singh has also undertaken a government-funded project as Principal Investigator. Her research areas include image processing, remote sensing, IoT, and machine learning. ",
        Education: [
          "Ph.D. Image Processing and Neural networks ",
          "IIT Roorkee ",
          "M.Tech. Computer Science Engineering ",
          "SU ",
          "B.Tech.Computer Science Engineering",
          "UP Technical University "
        ],
        Experience: [
          " Associate Professor at Bennett University, India ",
          " Associate Professor at Amity University ",
          " Associate Professor at Galgotias University",
          " Associate Professor at The NorthCap University",
          " Research Scholar at IIT Roorkee ",
          "Lecturer at AKGEC ",
          "Lecturer at College of Engineering Roorkee "
        ],
        Research: [
          " 1. Computer Vision",
          " 2. Machine Learning ",
          " 3. Deep Learning ",
          " 4. Remote Sensing "
        ],
        Projects: [],
        Distinction: [
          "Associate Editor, IEEE Access",
          "Guest Editor, Complex & Intelligent Systems (Springer)",
          "Guest Editor, Journal of Real time Image Processing (Springer)",
          "Guest Editor, Big Data Mining & Analytics Journal",
          "Guest Editor, Open Computer Science Journal",
          "Reviewer of IEEE Transactions on Neural Networks and Learning Systems",
          "Reviewer of Multiple SCI Journals"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-akansha-singh/"),
    Faculty_model(
        Name: "Dr. Mohd. Abuzar Sayeed",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Dr-Mohd-AbuzarB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "abuzar.sayeed@bennett.edu.in",
        About:
            "Dr. Abuzar was awarded PhD in Computer Science and Engineering (Unmanned Aerial Vehicles/Drones) at Thapar Institute of Engineering and Technology in 2021. Earlier he completed his M. Tech from School of Mathematics and Computer Applications at Thapar University in 2015. He specializes in mathematical modelling of collaborative network formations and drone trajectory. Dr. Abuzar possesses deep scientific and practical knowledge about drones (UAVs), collaborative networks and software defined networks.",
        Education: [
          "Ph.D. Computer Science and Engineering  ",
          "Thapar Institute of Engineering and Technology ",
          "M.Tech Computer Applications ",
          "Thapar University ",
          "B.Tech ",
          "Integral University"
        ],
        Experience: [
          " Assistant Professor at Bennett University, India ",
          " Assistant Professor at GLA University ",
          " Teaching Associate at Thapar Institute of Engineering and Technology",
          " Teaching Associate at Thapar University "
        ],
        Research: [
          " 1. Unmanned Aerial Vehicles (UAV)/Drones",
          " 2. Software Defined Networks",
          " 3. Collaborative Networks ",
          " 4. Internet of Things (IoT) "
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-mohd-abuzar-sayeed/"),
    Faculty_model(
        Name: "Dr. Bishwajit Roy",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Dr-BishwajitB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "bishwajit.roy@bennett.edu.in",
        About:
            "He has completed Ph.D. in Computer Science & Engineering at NIT Patna, India (2021). He has received M.E in Computer Science and Engineering from Jadavpur University, Kolkata in 2010 & a B. Tech. in Computer Science and Engineering from the West Bengal University of Technology, Kolkata in 2006. His current area of expertise is the design and develop hybrid optimizer coupled machine learning models, data preprocessing & analysis, and time series modeling. His current state-of-the-art is prediction task in several engineering application areas using computational intelligence techniques, mental stress detection, malware detection, and feature extraction & classification of objects from images using deep learning approaches.",
        Education: [
          "Ph.D. Computer Science & Engineering ",
          "National Institute of Technology Patna, India (NIT Patna)",
          "M.E. Computer Science & Engineering ",
          "Jadavpur University, India",
          "B.E. Computer Science & Engineering ",
          "Bengal College of Engineering and Technology, Durgapur, India(West Bengal University of Technology)"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at VIT Bhopal  ",
          "Assistant Professor at L. N. Mishra College of Business Management , Muzaffarpur",
          "Assistant Professor at IMPS College of Engineering and Technology, Malda ",
          "Software Engineer at IBM Kolkata ",
          "Lecturer at IMPS College of Engineering and Technology, Malda",
          "Lecturer (Part time) at Jalpaiguri Government Engineering College, Jalpaiguri"
        ],
        Research: [
          " 1. Applied Machine Learning ",
          " 2. Time Series Modelling ",
          " 3. Heuristic and Metaheuristic Optimization Algorithms ",
          " 4. Deep Learning "
        ],
        Projects: [],
        Distinction: [
          "Reviewer in 3 SCIE indexed and 2 Scopus indexed journals."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-bishwajit-roy/"),
    Faculty_model(
        Name: "Dr. Umesh Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Dr-UmeshB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "umesh.gupta@bennett.edu.in",
        About:
            "Mr. Umesh Gupta received a Bachelor of Technology (B. Tech) in Computer Science and Engineering from Dr. APJ Abdul Kalam Technical University, Lucknow, INDIA, in 2008, the Master of Engineering (M.E.) in Computer Science and Engineering from the National Institute of Technical Teacher's Training and Research (NITTTR), Chandigarh, INDIA, in 2013 with Gold Medal. He has submitted a Doctor of Philosophy (Ph.D.) Thesis in Computer science and Engineering (Specialization in Machine Learning) from the National Institute of Technology Arunachal Pradesh, Arunachal Pradesh, INDIA. He has worked for almost six years at Dr. APJ Abdul Kalam Technical University, Lucknow as Assistant Professor. He also has one year of industrial experience in the Telecommunication Industry as a Telecom Engineer. He has published about 24 research papers in National/ International Conferences/ Journals such as Applied soft computing, Applied Intelligence, Neural Processing Letters, and Machine Learning and Cybernetics. His research interest includes Machine Learning and optimization, Pattern recognition, Support Vector Machines, Image, and video processing.",
        Education: [
          "Ph.D. Computer Science & Engineering ",
          "NIT Arunachal Pradesh",
          "M.E. Computer Science & Engineering ",
          "NITTTR Chandigarh (Panjab Central University Chandigarh)",
          "B.Tech. Computer Science & Engineering ",
          "AKGEC, Uttar Pradesh Technical University Lucknow"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Senior Research Scholar /Teaching Assistant at NIT- Arunachal Pradesh, Arunachal Pradesh ",
          "Assistant Professor at IMSEC Engineering College, Ghaziabad, U.P. ",
          "Assistant Professor at MIET Engineering College Meerut, U.P.",
          "Senior Lecturer at KNGD Modi Engineering College Ghaziabad, U.P.",
          "Trainee Engineer at Ericsson India Ltd. HR.",
          "Lecturer at KNGD Modi Engineering College Ghaziabad, U.P."
        ],
        Research: [
          " 1. Machine Learning and optimization",
          " 2. Pattern Recognition ",
          " 3. Support Vector Machines",
          " 4. Extreme Learning Machines "
        ],
        Projects: [],
        Distinction: [
          "IEEE Membership",
          "Universal Association of Computer and Electronics Engineers (UACEE), USA."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-umesh-gupta/"),
    Faculty_model(
        Name: "Dr. Madhuri Gupta",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/09/Madhurib.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "madhuri.gupta@bennett.edu.in",
        About:
            "Ms. Gupta has been submitted her Ph.D. in Computer Science & Engineering at Jaypee Institute of Information Technology, Noida, India in 2021. She has earned research experience from CSIR-Central Scientific Instruments Organization (CSIO), Chandigarh, and Central Building Research Institute (CBRI), Roorkee. She has completed her M.Tech. from Banasthali Vidyapith, Jaipur in 2016. She has worked in several domains such as genetic disease prediction, bioinformatics, and Deep Learning.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Jaypee Institute of Information Technology, Noida",
          "M.Tech. in Computer Science & Engineering",
          "Banasthali Vidyapith, Jaipur (with the collaboration of CSIR-Central Scientific Instruments Organization (CSIO), Chandigarh)",
          "B.Tech. in Information Technology",
          "Uttar Pradesh Technical University, Lucknow"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at ABES Engineering College, Ghaziabad",
          "Research Scholar/ Teaching Assistant at Jaypee Institute of Information Technology, Noida",
          "Research Trainee at CSIR-Central Scientific Instruments Organization (CSIO), Chandigarh"
        ],
        Research: [
          " 1. Machine Learning and Deep Learning",
          " 2. Optimization ",
          " 3. Computational Bioinformatics",
          " 4. Data Analytics"
        ],
        Projects: [],
        Distinction: [
          "ACM-W Professional Member",
          "UGC NET-2018 Qualified",
          "Reviewer of Computational and Applied Mathematics (COAM)"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-madhuri-gupta/"),
    Faculty_model(
        Name: "Dr. Himansu Sekhar Pattanayak",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/HimanshuB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Himansu.sekhar@bennett.edu.in",
        About:
            "Himanshu is currently pursuing his Ph.D. from NIT Jalandhar in social network analysis and has submitted his thesis. He received his Bachelor in Technology from the  Biju Patnaik University of Technology, Odisha in 2009. He received his Master in Technology from the National Institute of Technology, Jalandhar, Punjab in 2011. His area of interest lies in social network analysis, Machine learning, Nature-inspired optimization techniques, and Analysis of algorithms.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "National Institute of Technology, Jalandhar",
          "M.Tech. in Computer Science & Engineering",
          "National Institute of Technology, Jalandhar",
          "B.Tech. in Information Technology",
          "Gandhi Institutes of Engineering and Technology, Gunupur, Odisha (Biju Patnaik University of Technology)"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at SRM IST, Modinagar",
          "Research Scholar/ Teaching Assistant at National Institute of Technology, Jalandhar",
          "Assistant Professor at National Institute of Technology, Jalandhar",
          "Assistant Professor at Morden Engineering and Management Studies, Balasore"
        ],
        Research: [
          " 1. Social Network Analysis",
          " 2. Nature-Inspired Optimization ",
          " 3. Machine Learning",
          " 4. Graph Theory"
        ],
        Projects: [],
        Distinction: [
          "Received fellowship for Ph.D Program in Computer Science & Engineering by Ministry of Human Resource & Development, Government of India from 2014-2018.",
          "Received fellowship for M.Tech. Program in Computer Science & Engineering by Ministry of Human Resource & Development, Government of India from 2009-2011.",
          "Qualified UGC-NET in June 2012."
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-himansu-sekhar-pattanayak/"),
    Faculty_model(
        Name: "Dr. Rohit Agrawal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Rohit-AgarwalB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Rohit.agrawal@bennett.edu.in",
        About:
            "Rohit Agrawal is pursuing (thesis submitted) his Ph.D. degree with the Indian Institute of Technology Indore, India. Earlier, he completed M.Tech (in Computer Application) from Indian School of Mines Dhanbad, India, and B.Tech in Computer Science and Engineering from Bundelkhand Institute Of Engineering and Technology Jhansi (GBTU, UP), India.His thesis focuses on novel optimization problem designing and their solutions in the context of data embedding and circuit design. His research interests are at the intersection of Computer Science and Mathematics, especially Optimization, Image Processing, FPGA Routing, and Machine Learning.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Indian Institute of Technology Indore, India",
          "M.Tech. in Computer Science & Engineering",
          "Indian School of Mines Dhanbad, India. ",
          "B.Tech. in Information Technology",
          "Bundelkhand Institute Of Engineering and Technology Jhansi (GBTU, UP), India."
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Graduate Research/Teaching Assistant at Indian Institute of Technology Indore, India",
          "Assistant Professor at JSS Academy of Technical Education Noida, India",
          "Graduate Research/Teaching Assistant at Indian School of Mines Dhanbad, India."
        ],
        Research: [
          " 1. Image Processing",
          " 2. Steganography ",
          " 3. Watermarking",
          " 4. Machne Learning",
          " 5. FPGA Routing"
        ],
        Projects: [],
        Distinction: [
          "1. IEEE Transactions on Parallel and Distributed Systems.2. IETE Journal of Research.3. Journal of Intelligent & Fuzzy Systems (IOS Press).4. International Conference on Soft Computing for Problem Solving (SoCProS 2020).5. Congress on Intelligent Systems (CIS 2020)."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rohit-agrawal/"),
    Faculty_model(
        Name: "Dr. Mohit Agarwal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Dr-MohitB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Mohit.agarwal@bennett.edu.in",
        About:
            "Dr. Mohit Agarwal has done B.Tech from IIT, Delhi in 1995 in Computer Science and Engineering. After this he has worked in software industry for period of around 17 years and then completed M.Tech in CSE from ABES-EC, Ghaziabad which is affiliated to Dr. A.P.J. Abdul Kalam Technical University, Lucknow. He has been in academics since 2016 and has been active in research work while completing PhD from Bennett University, Greater Noida.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Bennett University (BU), Greater Noida, 2021",
          "M.Tech. in Computer Science & Engineering",
          "ABES EC, Ghaziabad, affiliated to Dr. APJ AKTU, Lucknow, 2016",
          "B.Tech. in Computer Science & Engineering",
          "IIT Delhi, 1995"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at ABES Engineering College, Ghaziabad",
          "Research Scholar at Bennett University, Greater Noida",
          "Assistant Professor at ABES EC, Ghaziabad",
          "M.Tech student full time at ABES EC, Ghaziabad",
          "Sr. Software Engineer at Birlasoft, Noida",
          "Manager at Egis India Consulting Pvt. Ltd., Faridabad",
          "Sr. System Analyst at Ebix, Noida",
          "Project Manager at Activa Softech Pvt. Ltd. Noida",
          "Sr. Member of Technical Staff at Cadence, Noida",
          "Sr. System Designer at Riverrun, Noida",
          "Asst. Executive Engineer at ITI, Naini"
        ],
        Research: [
          " 1. Deep Learning",
          " 2. Image Processing ",
          " 3. Plant disease classification and segmentation using CNN"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-mohit-agarwal/"),
    Faculty_model(
        Name: "Dr. Ankit Kumar Jaiswal",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Ankit-JaiswalB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Ankit.jaiswal@bennett.edu.in",
        About:
            "Mr. Ankit Kumar Jaiswal submitted his Ph.D.  in Computer Science and Engineering, Indian Institute of Technology (BHU), Varanasi. His research area focuses on Digital Image Processing and Computer Vision. During his research, he published 8 research articles in different international journals and conferences. He is also having industry experience of 1+ years in web-based application development. ",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "IIT (BHU), Varanasi",
          "M.Tech. in Computer Science & Engineering",
          "MMM University of Technology, Gorakhpur",
          "B.Tech. in Computer Science and Engineering",
          "AKTU, Lucknow"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Programmer at Sun Integrated Technologies and Applications, New Delhi"
        ],
        Research: [
          " 1. Digital Image Processing and Computer Vision",
          " 2. Pattern Recognition ",
          " 3. Machine Learning",
          " 4. Artificial Intelligence"
        ],
        Projects: [],
        Distinction: [
          "Reviewer of Springers Multi-media Tools and Applications.",
          "Reviewer of Springers The Visual Computer"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-ankit-kumar-jaiswal/"),
    Faculty_model(
        Name: "Dr. Ankush Jain",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Ankush-JainB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Ankush.jain@bennett.edu.in",
        About:
            "Mr. Ankush Jain has completed his Ph.D. and submitted the doctoral dissertation at ABV-Indian Institute of Information Technology and Management (ABV-IIITM), Gwalior, in 2021. He received his M. Tech. degree with a specialization in Advanced Networks from ABV-IIITM, Gwalior in 2017, and B. Tech. degree in Computer Science and Engineering from Rajasthan Technical University, Kota, in 2014. Mr. Jain has published seven SCI papers in his area of interest and proficiency in various peer-reviewed international journals of high repute.  He serves as a reviewer in various international journals, e.g., IEEE Sensors Journal, ESWA, and IJECE. His research interests include Recommendation Systems, Evolutionary Computation, Face Hallucination, and Machine Learning. He is a student member of IEEE.",
        Education: [
          "Ph.D in Information Technology",
          "Indian Institute of Information Technology and Management, Gwalior",
          "M.Tech. in Advanced Networks",
          "Indian Institute of Information Technology and Management, Gwalior",
          "B.Tech. in Computer Science & Engineering",
          "Rajasthan Technical University, Kota"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Graduate Research/Teaching Assistant at Indian Institute of Information Technology and Management, Gwalior",
          "Graduate Research/Teaching Assistant at Indian Institute of Information Technology and Management, Gwalior",
          "Graduate Research/Teaching Assistant at Indian School of Mines Dhanbad, India."
        ],
        Research: [
          " 1. Recommendation Systems",
          " 2. Face Hallucination",
          " 3. Evolutionary Computation",
          " 4. Wireless Sensor Networks",
          " 5. Machine Learning"
        ],
        Projects: [],
        Distinction: [
          "Student Member of IEEE",
          "Reviewer of various international journals, e.g., IEEE Sensors Journal, ESWA, and IJECE."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-ankush-jain/"),
    Faculty_model(
        Name: "Dr. Riti Kushwaha",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/RitiB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Riti.kushwaha@bennett.edu.in",
        About:
            "Dr. Riti Kushwaha has earned his PhD and M.Tech in Computer Science & Engineering at the Malaviya National Institute of Technology, Jaipur, India in 2021, and 2012 respectively. She has worked in multiple organizations where she was involved in multiple departmental activities. Her work focus on person recognition using footprint identity of person using machine learning and deep learning algorithms where She has developed multiple methods. ",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Malaviya National Institute of Technology, Jaipur",
          "M.Tech. in Computer Science & Engineering",
          "Malaviya National Institute of Technology, Jaipur",
          "B.Tech. in Computer Science & Engineering",
          "PSIT Kanpur, UP, INDIA (AKTU)"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at Galgotia College of Engineering and Technology, UP, INDIA",
          "Assistant Professor at IEC Engineering College, UP, INDIA",
          "Guest Faculty at MNIT Jaipur, Raj. India.",
          "Assistant Professor at JECRC UDML College of Engg.",
          "Assistant Professor at BMIT Jaipur"
        ],
        Research: [
          " 1. Biometric",
          " 2. Machine Learning",
          " 3. Pattern Recognition",
          " 4. Deep Learning"
        ],
        Projects: [],
        Distinction: ["Reviewer of Multimedia Tools and Applications"],
        profile: "https://www.bennett.edu.in/faculties/dr-riti-kushwaha/"),
    Faculty_model(
        Name: "Dr. Ajay Kumar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Ajay-KumarB.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "Ajay.kumar@bennett.edu.in",
        About:
            "Ajay Kumar completed hismaster of technology in ComputerScience & Engineeringfrom Samrat Ashok TechnologicalInstitute, Vidisha (M.P.)and Bachelor of Technology inComputer Science & Engineeringfrom R.K.D.F Instituteof Science and TechnologyBhopal (M.P.). He is pursuingPh.D. in Computer Science andEngineering from Indian Instituteof Technology (BHU),Varanasi. His research interestsinclude Link Predictionand Influence Maximization insocial/complex networks.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Indian Institute of Technology, BHU (Varanasi)",
          "M.Tech. in Computer Science & Engineering",
          "Samrat Ashok Technological Institute, Vidisha (M.P)",
          "B.E. in Computer Science & Engineering",
          "R.K.D.F. Institute of Science &amp; Technology, Bhopal (M.P)"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at Amity University, Gwalior (M.P)",
          "Research Scholar / Teaching Assistant at Indian Institute of Technology, BHU (Varanasi)",
          "Assistant Professor at Noida Institute of Engineering & Technology, Greater Noida (U.P)",
          "M.Tech Teaching Assistant  at Samrat Ashok Technological Institute, Vidisha (M.P)"
        ],
        Research: [
          " 1. Link Prediction ",
          " 2. Influence Maximization",
          " 3. Community Detection"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-ajay-kumar/"),
    Faculty_model(
        Name: "Dr. Navneet Pratap Singh",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Navneetb.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "navneet.singh@bennett.edu.in",
        About:
            "Dr. Singh was an Assistant Professor at LNMIIT Jaipur from Jan 2021 to Aug. 2021. He earned his PhD in Computer Science & Engineering at the IIT Indore, India in 2021. Earlier, he completed M.Tech in Applied Mathematics from DIAT-DRDO, Pune, India in 2013. Broadly, He is working in the field of Computational Science. This encompasses the use of Mathematics and Computer Science to solve Science and Engineering problems. Currently, He is working on preconditioning techniques, cheap preconditioning techniques, and inexact linear solves for model order reduction. Also exploring the applications of preconditioning techniques and inexact linear solves in the area of Machine Learning and Deep Learning",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "IIT, Indore",
          "M.Tech in Modelling and Simulation (Applied Mathematics)",
          "Defence Institute of Advanced Technology, Pune",
          "B.Tech in Computer Science & Engineering",
          "Uttar Pradesh Technical University, Lucknow, UP"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India",
          "Assistant Professor, LNMIIT Jaipur",
          "Graduate Research/Teaching Assistant, Indian Institute of Technology Indore, India"
        ],
        Research: [
          " 1. Numerical Linear Algebra",
          " 2. Model Order Reduction & Optimization",
          " 3. Machine Learning",
          " 4. Object-detection",
          " 5. Algorithm Analysis"
        ],
        Projects: [],
        Distinction: [
          "IETE Journal of Research (Journal)",
          "IEEE Access (Journal)",
          "J. of Intelligent & Fuzzy Systems (Journal)",
          "10th Intl. Conf. on Soft Computing for Problem Solving (Conferences)"
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-navneet-pratap-singh/"),
    Faculty_model(
        Name: "Dr. Vikas Malviya",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Photo-Vikas-Malviyab.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "vikas.malviya@bennett.edu.in",
        About:
            "Dr. Malviya earned his Masters and Doctorate in Computer Science & Engineering at the Indian Institute of Information Technology, Design and Manufacturing, Jabalpur, India. His doctorate work was done in the broad area of Cyber Security in which he analyzed the security of web and mobile applications and developed solutions for that. Besides this he also has interest in programming and developing software.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Indian Institute of Information Technology, Design and Manufacturing Jabalpur (IIITDM, Jabalpur)",
          "Master of Technology in Computer Science & Engineering",
          "Indian Institute of Information Technology, Design and Manufacturing Jabalpur, India",
          "Bachelor of Engineering in Information Technology",
          "Government Engineering College, Jabalpur, India"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at Symbiosis Skill and Professional University, Pune, Maharashtra, India",
          "Assistant Professor at NIIT University, Neemrana, Rajasthan, India",
          "Assistant Professor at National Institute of Technology, Raipur, Chhattisgarh, India"
        ],
        Research: [
          " 1. Security of Web and Mobile Applications",
          " 2. Use of Machine Learning in Cyber Security",
          " 3. Big Data Processing",
          " 4. Blockchain"
        ],
        Projects: [],
        Distinction: [],
        profile: "https://www.bennett.edu.in/faculties/dr-vikas-malviya/"),
    Faculty_model(
        Name: "Dr. Nitin Arvind Shelke",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Nitinb.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "itin.shelke@ bennett.edu.in",
        About:
            "Nitin Arvind Shelke is an Assistant Professor at the Computer Science Engineering Department, Bennett University. He has extensive work experience in research, teaching and corporate training with multiple organizations in the past. His research interests include Machine Learning, Multimedia Security and NLP with multiple publications in SCI journals and International Conferences.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "TIET, Patiala",
          "M.Tech. in Computer Science & Engineering",
          "Government College of Engineering, Amravati",
          "B.E. in Computer Science & Engineering",
          "Sant Gadge Baba Amravati University"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Trainer (Data Analytics), Business Analytics and Big Data Dept, LMTSM, Thapar University, Dera Bassi Campus.",
          "Research Scholar/Teaching Associate, Thapar Institute of Engineering and Technology, Patiala",
          "Assistant Professor, G H Raisoni College of Engineering (GHRU) Amravati ",
          "M Tech Research Scholar/Teaching Assistant, Government College of Engineering, Amravati"
        ],
        Research: [
          " 1. Machine Learning ",
          " 2. Deep Learning",
          " 3. Multimedia Security",
          " 4. NLP"
        ],
        Projects: [],
        Distinction: [
          "Member of Computer Society of India (CSI)",
          "Member of Indian Society for Technical Education (ISTE)",
          "Reviewer of Computers and Electrical Engineering (Elsevier)",
          "Reviewer of Expert Systems with Applications (Elsevier)",
          "Reviewer of KSII Transactions on Internet and Information Systems",
          "Editorial Board Member of IJSBT - International Journal of Smart Business and Technology (Global Vision Press)",
          "Guest Editor for the Special Issue Recurrent Neural Networks, Bifurcation Analysis and Control Theory of Complex Systems in the journal Applied and Computational Mathematics. ",
          "",
          "Invited as an expert in the  AICTE approved 6 Days/One Week Short Term Training Programme on \"Python Programming '' organized by  Department of Computer Science & Engineering, Giani Zail Singh Campus College of Engineering & Technology, MAHARAJA RANJIT SINGH PUNJAB TECHNICAL UNIVERSITY, BATHINDA (PUNJAB) , INDIA held during 15/3/2021 (ONLINE).",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on \"Introduction to Python Programming\" Jointly organized by Rajasthan Technical University, Poornima College of Engineering, Jaipur, held during 25 - 29 Jan 2021 (Conducted 3 Session in Online Mode).",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on \"Big Data Analytics\" Jointly organized by Rajasthan Technical University, Arya College of Engineering & Information Technology, Jaipur, held during 18 - 22 Jan 2021 (Conducted 3 Session in Online Mode).",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on \"Intelligent Data Exploration and Analysis\" Jointly organized by Rajasthan Technical University, Arya College of Engineering & Research Centre, Jaipur, held during 11 - 15 Jan 2021 (Conducted 3 Session in Online Mode).",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on Artificial Intelligence and Its Applications Jointly organized by Rajasthan Technical University, Arya Institute of Engineering Technology & Management, Jaipur, held during 26 - 30 Dec 2020 (Conducted 3 Session in Online Mode).",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on Natural Language Processing using Python Jointly organized by Rajasthan Technical University, Kota, and Compucom Institute of Technology and Management Jaipur held during 07 - 11 Dec 2020 (Conducted 5 Session in Online Mode).",
          "",
          "Invited as an expert speaker workshop entitled Machine Learning with Python under Capacity Building and Research Entrepreneurship Centre in Artificial Intelligence, Big Data and IoT for SC/ST, project sanctioned by Ministry of Electronics & Information Technology (MeitY), Government of India, R&D in CC&BT from 07 Sep 2020 to 07 Oct 2020 (Conducted 23 Session in Online Mode)",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on Emerging Trends in Data Science Jointly organized by Rajasthan Technical University, Kota and Rajasthan Institute of Engineering and Technology, Jaipur held during 07 Sep - 11 Sep 2020 (Conducted 5 Session in Online Mode).",
          "",
          "Invited as an expert in the TEQIP-III sponsored Workshop on \"Natural Language Processing using Python\" Jointly organized by Rajasthan Technical University, Kota and Jaipur Engineering College & Research Centre held during 01 - 05 Sep 2020 (Conducted 5 Lecture in Online Mode).",
          "",
          "Invited as an expert in the summer school workshop on \"Machine Learning and Deep Learning\" held at Computer Science and Engineering Department TIET Patiala in July 2019 (Conducted 3 Sessions in Offline Mode).",
          "Contributed as a Resource Person for four days in the workshop \"Machine Learning and Optimization\" held at Computer Science and Engineering Department TIET Patiala in July 2018 (Conducted 3 Sessions in Offline Mode).",
          "GATE Qualified: 2012",
          "GATE Qualified: 2014",
          "Nitin Arvind Shelke & P. N. Chatur, \"Optimized and hybrid-based watermarking system for digital video security,\" 2016 International Conference on Wireless Communications, Signal Processing and Networking (WiSPNET), Chennai, 2016, pp. 1068-1074.",
          "Nitin Arvind Shelke & Singara Singh Kasana, \"Image Forgery Type and Identification: A Survey\", Presented in International Conference on Electrical, Electronics, Computers, Communication, Mechanical and Computing (EECCMC), Vellore, January 2018."
        ],
        profile:
            "https://www.bennett.edu.in/faculties/dr-nitin-arvind-shelke/"),
    Faculty_model(
        Name: "Dr. Mahsh Kumawat",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/mahesh-Kumawatb.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "mahesh.kumawat@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D. (IIT Indore)",
          "IIT Indore",
          "M.E. (Electronics)",
          "Iet-Davv, Indore",
          "B.E. (instrumentation & control)",
          "RGPV, Bhopal"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at PIEMR Indore",
          "Assistant Professor at SVITS Indore",
          "Lecturer at SVITS Indore"
        ],
        Research: [
          " 1. High Speed Serial Link",
          " 2. Current Mode Logic",
          " 3. Analog Vlsi Design "
        ],
        Projects: [],
        Distinction: [
          "Reviewer of Journal of Circuits, Systems and Computers, World Scientific"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-mahsh-kumawat/"),
    Faculty_model(
        Name: "Dr. Rachna Kohar",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Photo-Rachnab.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "rachna.kohar@bennett.edu.in",
        About:
            "Dr. Rachna has completed her Ph.D. in Computer Science from JNU, New Delhi. She has extensive work experience with various academic organizations and IT industry in the past. Her research interests include Software Engineering, Service Oriented Architecture and Database systems with multiple publications in SCI and Scopus indexed journals as well as in international conferences. She is reviewer of SCI indexed journals and international conferences.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "JNU, New Delhi",
          "M.Tech in Computer Science & Engineering",
          "Banasthali Vidyapith"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at Lovely Professional University",
          "Assistant Professor at Galgotias University"
        ],
        Research: [
          " 1. Software Engineering",
          " 2. Service Oriented Architecture",
          " 3. Database systems "
        ],
        Projects: [],
        Distinction: [
          "UGC NET qualified in Computer Science",
          "GATE qualified in Computer Science and Information Technology",
          "CSIR SRF (Senior Research Fellowship)",
          "Reviewer of SCI indexed journals and international conferences."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-rachna-kohar/"),
    Faculty_model(
        Name: "Dr. Avishek Banerjee",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Photo-Avisheksb.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Computer Science Engineering",
        Position: "null",
        Email: "avishek.banerjee@bennett.edu.in",
        About:
            "Dr. Banerjee earned his PhD in Engineering at Jadavpur University, India in 2019. He received the EU sponsored Erasmus Mundus scholarship at the University of Gheorghe Asachi, Iasi, Romania for 23 months of mobility. Earlier, he completed M.Tech. (in Information Technology) from Calcutta University, India in 2007. He completed B.Tech. (in Information Technology) from Vidyasagar University, India in 2007. He worked with different hybridization techniques of evolutionary algorithms to develop different hybrid Algorithms. Not only has he worked in several scientific fields such as Reliability Optimization and Evolutionary Algorithms, but he has also deep knowledge in engineering fields like Wireless Sensor Networks, Power Distribution System and Natural Language Processing.",
        Education: [
          "Ph.D in Computer Science & Engineering",
          "Jadavpur University, India",
          "M.Tech in Information Technology",
          "Calcutta University, India",
          "B.Tech in Information Technology",
          "Haldia Institute of Technology, India (Vidyasagar University)"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Assistant Professor at Asansol Engineering College",
          "Research Fellow at Technical Institute of Iasi, Romania",
          "Assistant Professor at Asansol Engineering College"
        ],
        Research: [
          " 1. Wireless Sensor Network",
          " 2. Hybrid Algorithms",
          " 3. Machine Learning",
          " 3. Evolutionary Algorithms",
          " 3. Reliability Optimization",
          " 3. Natural Language Processing"
        ],
        Projects: [],
        Distinction: [
          " Reviewer of Int. J. Swarm and Evolutionary Computation, Elsevier. ",
          " Reviewer of Int. J. Soft Computing, Springer.",
          "Reviewer of Int. J. Applied Soft Computing, Elsevier.",
          "Reviewer of Journal of The Institution of Engineers (India): Series B, Elsevier."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-avishek-banerjee/"),
    Faculty_model(
        Name: "Dr. Vibhuti Joshi",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Vibhutib.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "Vibhuti.Joshi@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D in Cellular and Molecular Biology",
          "Indian Institute of Technology Jodhpur (IITJ), India",
          "M.Sc. in Biotechnology",
          "Mohanlal Sukhadia University, India",
          "B.Sc. in Biotechnology",
          "Mohanlal Sukhadia University, India"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Neuro-Oncology Branch at National Cancer Institute, NIH USA",
          "Alzheimers Project at Gujarat Biotechnology Research Centre, Gandhinagar, Gujarat, India"
        ],
        Research: [
          " 1. Neuro-Oncology",
          " 2. Protein quality control system",
          " 3. Neurodegeneration"
        ],
        Projects: [],
        Distinction: [
          "Fellows Award for Research Excellence (FARE) by NIH-2021",
          "CSIR-UGC Junior Research Fellowship (AIR-63)-2013",
          "GATE (Life-Sciences)-2013",
          "State Eligibility Test (Rajasthan)-2012",
          "Summer Research Fellowship by IASc, INSA and NASI -2011"
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-vibhuti-joshi/"),
    Faculty_model(
        Name: "Dr. Vaishali Verma",
        Image:
            "https://www.bennett.edu.in/wp-content/uploads/2021/10/Vaishali-Vermab-1.png",
        Designation: "Assistant Professor",
        School: "School of Engineering and Applied Sciences",
        Department: "Biotechnology",
        Position: "null",
        Email: "vaishali.verma@bennett.edu.in",
        About: "null",
        Education: [
          "Ph.D in Biochemistry",
          "University of Delhi",
          "M.Sc. in Biochemistry",
          "University of Delhi",
          "B.Sc. in Biochemistry",
          "Sri Venkateswara College, University of Delhi"
        ],
        Experience: [
          "Assistant Professor at Bennett University, India ",
          "Scientist-B at Centre for Innovation in Infectious Disease Research, Education and Training (CIIDRET) at University of Delhi South Campus"
        ],
        Research: [
          " 1. Antibody discovery and engineering for diagnostic and therapeutic applications using Phage display"
        ],
        Projects: [],
        Distinction: [
          "2021, Won Award of Excellence from the Antibody Society, USA for the poster presentation in Virtual Antibody Engineering & Therapeutics, Europe. ",
          "2020, Won AWSAR award for scientific story writing in PDF category from Department of Science and Technology, Ministry of Science and Technology, Government of India.  ",
          "2019, Won the prestigious Biotech Product & Process Commercialization Award-2019 for the development of A phage-displayed Na\u00efve Human Antibody Library for the discovery of therapeutic antibodies from the Department of Biotechnology, Ministry of Science and Technology, Government of India.   ",
          "2019, Won Best Poster Award at Global Bio-India 2019 conference organized by DBT-BIRAC in November 2019 ",
          "2018, Received GYAN Scholarship award for poster presentation at Nextgen Genomics, Biology, Bioinformatics and Technologies Conference (NGBT) 2018 organized by SciGenom Research Foundation (SGRF). ",
          "2012, Awarded Gold medal for securing First position in University of Delhi in M.Sc. Biochemistry.",
          "2011, Qualified CSIR-NET (JRF) examination.",
          "2007-2012, Received Scholarship for Higher Education (SHE) from Department of Science and Technology (DST), Ministry of Science and Technology (Govt. of India) under a scheme Innovation in Science Pursuit for Inspired Research (INSPIRE).",
          "2007, Received scholarship from Department of Biotechnology (DBT), Ministry of Science and Technology (Govt. of India) for securing highest marks in biology in 12th standard in AISSCE in 2007."
        ],
        profile: "https://www.bennett.edu.in/faculties/dr-vaishali-verma/")
  ];
}

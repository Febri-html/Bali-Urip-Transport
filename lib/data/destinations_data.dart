// lib/data/destinations_data.dart

import '../models/destination_model.dart';
import 'package:flutter/material.dart';

const List<Destination> allDestinations = [
  // ════════════════════════════════════════════════════════
  // SPIRITUAL
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Pura Lempuyang',
    location: 'Karangasem, Bali',
    tag: 'Spiritual',
    tagColor: TagColors.spiritual,
    description:
        'Dikenal sebagai "Gate of Heaven", gerbang pura Lempuyang menawarkan framing foto kelas dunia dengan latar Gunung Agung. Salah satu pura tertua dan tersuci di Bali, berdiri di ketinggian 1.175 mdpl.',
    image: 'assets/images/destinations/spiritual/lempuyang1.jpeg',
    localImages: [
      'assets/images/destinations/spiritual/lempuyang1.jpeg',
      'assets/images/destinations/spiritual/lempuyang2.jpeg',
      'assets/images/destinations/spiritual/lempuyang3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
      'https://images.unsplash.com/photo-1680188700615-ed31c1d23054?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZGVzYSUyMHBlbmdsaXB1cmFufGVufDB8fDB8fHww',
      'https://media.istockphoto.com/id/2259202398/photo/pura-lempuyang-in-bali-temples-gate-at-sunset-with-a-romantic-couple-standing-in-the-gate-and.webp?a=1&b=1&s=612x612&w=0&k=20&c=t3zlcdJIUVAi6CF_Yn5Azy45j3q8tRbb87dWBEFuBFM=',
    ],
    highlights: ['Gate of Heaven', 'Gunung Agung View', 'Sacred Temple'],
    bestTime: 'Morning (6–10 AM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Tanah Lot',
    location: 'Tabanan, Bali',
    tag: 'Spiritual',
    tagColor: TagColors.spiritual,
    description:
        'Pura ikonik di atas batu karang yang dikelilingi ombak laut. Sunset di sini adalah salah satu yang paling dramatis di Bali — langit oranye kemerahan dengan siluet pura yang memukau. Wajib dikunjungi!',
    image: 'assets/images/destinations/spiritual/tanah_lot.jpeg',
    localImages: [
      'assets/images/destinations/spiritual/tanah_lot.jpeg',
      'assets/images/destinations/spiritual/tanah_lot2.jpeg',
      'assets/images/destinations/spiritual/tanah_lot3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
      'https://images.unsplash.com/photo-1624935851312-845758a99160?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGFuYWglMjBsb3R8ZW58MHx8MHx8fDA%3D',
      'https://images.unsplash.com/photo-1566811851038-0580f1fb9082?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fHRhbmFoJTIwbG90fGVufDB8fDB8fHww',
    ],
    highlights: ['Sunset View', 'Sea Temple', 'Cultural Site'],
    bestTime: 'Sunset (5–7 PM)',
    duration: '1.5 – 2 hours',
  ),
  Destination(
    title: 'Pura Tirta Empul',
    location: 'Tampaksiring, Gianyar',
    tag: 'Spiritual',
    tagColor: TagColors.spiritual,
    description:
        'Pura air suci tempat ritual melukat (penyucian diri) yang telah berlangsung sejak abad ke-10. Wisatawan bisa ikut merasakan ritual mandi di kolam suci dengan pancuran air yang dipercaya memiliki kekuatan penyembuhan.',
    image: 'assets/images/destinations/spiritual/tirta_empul.jpeg',
    localImages: [
      'assets/images/destinations/spiritual/tirta_empul.jpeg',
      'assets/images/destinations/spiritual/tirta_empul2.jpeg',
      'assets/images/destinations/spiritual/tirta_empul3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
      'https://images.unsplash.com/photo-1641082918149-24470fe02c39?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGlydGElMjBlbXB1bHxlbnwwfHwwfHx8MA%3D%3D',
      'https://media.istockphoto.com/id/1361404408/photo/pura-tirta-empul-temple-on-bali.webp?a=1&b=1&s=612x612&w=0&k=20&c=FJsNud_78aO78ZPTV1hkJpoz4toZwhjzP3SLvdcadYA=',
    ],
    highlights: ['Holy Spring', 'Melukat Ritual', 'Ancient Temple'],
    bestTime: 'Morning (7–11 AM)',
    duration: '1.5 – 2 hours',
  ),
  Destination(
    title: 'Uluwatu Temple',
    location: 'Pecatu, Badung',
    tag: 'Spiritual',
    tagColor: TagColors.spiritual,
    description:
        'Pura megah di tebing 70 meter di atas Samudera Hindia. Pertunjukan Kecak Dance saat sunset di sini adalah pengalaman budaya paling memorable di Bali. Monyet-monyet liar berkeliaran bebas di area pura.',
    image: 'assets/images/destinations/spiritual/uluwatu2.jpeg',
    localImages: [
      'assets/images/destinations/spiritual/uluwatu2.jpeg',
      'assets/images/destinations/spiritual/uluwatu3.jpeg',
      'assets/images/destinations/spiritual/uluwatu4.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
      'https://media.istockphoto.com/id/2241283743/photo/uluwatu-temple-aerial-view.webp?a=1&b=1&s=612x612&w=0&k=20&c=sR3Jc2Hu91xelFrFllUhIkQTYzjyIf3JTfKpTtM393I=',
      'https://media.istockphoto.com/id/477033138/id/foto/traditional-balinese-kecak-dance-at-uluwatu-temple-bali-indonesia.jpg?s=612x612&w=0&k=20&c=QbBPhxrjaaAxgZiKKD2WMr8F70uQmsg1loY1xA3AEWo=',
    ],
    highlights: ['Kecak Dance', 'Cliff View', '70m Above Sea'],
    bestTime: 'Sunset (4–7 PM)',
    duration: '2 – 3 hours',
  ),

  // ════════════════════════════════════════════════════════
  // ALAM
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Tegalalang Rice Terrace',
    location: 'Ubud, Gianyar',
    tag: 'Alam',
    tagColor: TagColors.alam,
    description:
        'Sawah terasering hijau royo-royo dengan sistem irigasi subak yang sudah diakui UNESCO. Jalan setapak di antara padi yang menguning, ayunan di atas jurang hijau, dan kopi luwak langsung dari kebun — semuanya ada di sini.',
    image: 'assets/images/destinations/alam/tegalalang.jpeg',
    localImages: [
      'assets/images/destinations/alam/tegalalang.jpeg',
      'assets/images/destinations/alam/tegalalang2.jpeg',
      'assets/images/destinations/alam/tegalalang3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573347673737-3d27f04cdb90?w=800',
      'https://media.istockphoto.com/id/515480864/id/foto/sawah-yang-indah-ubud-bali-indonesia.jpg?s=612x612&w=0&k=20&c=_X0d7MMGx7OZw_8n0SYTqXXs81c1NJpNFrdcnqCd8z0=',
      'https://images.unsplash.com/photo-1559637377-eabfd1b283bc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHRlZ2FsYWxhbmd8ZW58MHx8MHx8fDA%3D',
    ],
    highlights: ['UNESCO Heritage', 'Rice Fields', 'Swing Above Valley'],
    bestTime: 'Morning (7–11 AM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Kintamani & Danau Batur',
    location: 'Kintamani, Bangli',
    tag: 'Alam',
    tagColor: TagColors.alam,
    description:
        'Kaldera gunung berapi raksasa dengan pemandangan Danau Batur yang memesona. Makan siang di restoran tepi kaldera dengan view yang tiada duanya sambil menikmati udara pegunungan yang sejuk dan segar.',
    image: 'assets/images/destinations/alam/kintamani.jpeg',
    localImages: [
      'assets/images/destinations/alam/kintamani.jpeg',
      'assets/images/destinations/alam/kintamani2.jpeg',
      'assets/images/destinations/alam/kintamani3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://images.unsplash.com/photo-1711609110590-5ad5c4599e56?q=80&w=871&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://media.istockphoto.com/id/1317276731/id/foto/situs-glamping-romantis-di-malam-hari.jpg?s=612x612&w=0&k=20&c=wzGmBsRB5_lt-90YTZtaZF78qG4-b4_SxZoW5oHByYI=',
    ],
    highlights: ['Volcano Caldera', 'Lake View', 'Cool Mountain Air'],
    bestTime: 'Morning (9 AM – 1 PM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Air Terjun Sekumpul',
    location: 'Buleleng, Bali',
    tag: 'Alam',
    tagColor: TagColors.alam,
    description:
        'Dijuluki air terjun terindah di Bali — tujuh aliran air jatuh sekaligus di balik hutan tropis yang lebat. Trek turun ke air terjun melewati kebun cokelat dan sungai jernih sudah menjadi bagian dari petualangannya.',
    image: 'assets/images/destinations/alam/sekumpul1.jpeg',
    localImages: [
      'assets/images/destinations/alam/sekumpul1.jpeg',
      'assets/images/destinations/alam/sekumpul2.jpeg',
      'assets/images/destinations/alam/sekumpul3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1540202404-d0c7fe46a1b5?w=800',
      'https://media.istockphoto.com/id/1336624198/id/foto/wanita-berbusana-pirus-di-air-terjun-sekumpul-di-hutan-di-pulau-bali-indonesia-konsep-bali.jpg?s=612x612&w=0&k=20&c=-XDM6aNdLVsiV_5PBTw8W4PoBHNql58qEV57HzT6ZWQ=',
      'https://media.istockphoto.com/id/1411604420/id/foto/air-terjun-sekumpul-di-bali-utara-indonesia-tujuan-wisata-utama.jpg?s=612x612&w=0&k=20&c=WqGEOQIhqJtt-ziAQcwthiNZ4vYubJG_XN6EJW9CmJc=',
    ],
    highlights: ['7 Waterfalls', 'Jungle Trek', 'Hidden Paradise'],
    bestTime: 'Morning (8–11 AM)',
    duration: '3 – 4 hours',
  ),
  Destination(
    title: 'Bedugul & Ulun Danu',
    location: 'Tabanan, Bali',
    tag: 'Alam',
    tagColor: TagColors.alam,
    description:
        'Danau kawah Beratan dengan Pura Ulun Danu yang mengapung di atas air — pemandangan paling ikonik di Bali yang pernah ada di uang kertas Rp50.000. Udara sejuk pegunungan bikin pikiran fresh total.',
    image: 'assets/images/destinations/alam/bedugul1.jpeg',
    localImages: [
      'assets/images/destinations/alam/bedugul1.jpeg',
      'assets/images/destinations/alam/bedugul2.jpeg',
      'assets/images/destinations/alam/bedugul3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1555400038-63f5ba517a47?w=800',
      'https://media.istockphoto.com/id/1503227069/id/foto/pasangan-muda-turis-bersantai-dan-menikmati-pemandangan-indah-di-pura-ulun-danu-beratan-di.jpg?s=612x612&w=0&k=20&c=wDUXuXUwmFzUh3vmjnrxWgpwUtdzhdCtX1TRGpmsm7k=',
      'https://media.istockphoto.com/id/1286199555/id/foto/pura-ulun-danu-bratan-hindu-temple-on-bratan-lake-landscape-at-sunrise-in-bali-indonesia.jpg?s=612x612&w=0&k=20&c=UOGVmx_G3hKs1Yr1XXu5-rm4SIUZoOWszxpbJdqPr44=',
    ],
    highlights: ['Mountain Lake', 'Floating Temple', 'Cool Weather'],
    bestTime: 'Morning (7–11 AM)',
    duration: '2 – 3 hours',
  ),

  // ════════════════════════════════════════════════════════
  // PANTAI
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Pantai Kelingking',
    location: 'Nusa Penida, Klungkung',
    tag: 'Pantai',
    tagColor: TagColors.pantai,
    description:
        'Tebing berbentuk T-Rex yang sudah mendunia di Instagram. Pantai tersembunyi di bawah tebing dengan pasir putih dan air biru toska yang jernih. Turun ke bawah butuh effort, tapi hasilnya sepadan banget.',
    image: 'assets/images/destinations/pantai/klingking.jpeg',
    localImages: [
      'assets/images/destinations/pantai/klingking4.jpeg',
      'assets/images/destinations/pantai/klingking2.jpeg',
      'assets/images/destinations/pantai/klingking3.jpeg',
    ],
    networkImages: [
      'https://media.istockphoto.com/id/2164033000/id/foto/pantai-kelingking-bali-adalah-salah-satu-landmark-paling-ikonik-di-bali-indonesia.jpg?s=612x612&w=0&k=20&c=I1PGoN0vAxG8gWDwSdT7jC1qKi46SWCF4CNtbGagS10=',
      'https://media.istockphoto.com/id/2223531856/photo/aerial-view-of-kelingking-beach-on-nusa-penida.webp?a=1&b=1&s=612x612&w=0&k=20&c=nNuWUZong5bQx8lbspQC-iR72Gc3l8fIy4MLCYFbMAM=',
      'https://images.pexels.com/photos/12595741/pexels-photo-12595741.jpeg',
    ],
    highlights: ['T-Rex Cliff', 'Hidden Beach', 'Instagram Iconic'],
    bestTime: 'Morning (8–11 AM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Pantai Pandawa',
    location: 'Kutuh, Badung',
    tag: 'Pantai',
    tagColor: TagColors.pantai,
    description:
        'Pantai tersembunyi di balik tebing kapur setinggi 50 meter yang diukir patung Pandawa. Pasir putih bersih, ombak tenang, dan air laut kehijauan yang cocok untuk berenang dan kayaking.',
    image: 'assets/images/destinations/pantai/pandawa.jpeg',
    localImages: [
      'assets/images/destinations/pantai/pandawa.jpeg',
      'assets/images/destinations/pantai/pandawa2.jpeg',
      'assets/images/destinations/pantai/pandawa3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=800',
      'https://images.unsplash.com/photo-1583402435083-5fff7cbf1c34?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGFuZGF3YXxlbnwwfHwwfHx8MA%3D%3D',
      'https://media.istockphoto.com/id/2196219295/id/foto/pantai-pandawa-wisata-populer-di-pulau-bali-dengan-pemandangan-indah-mercusuar-dan-laut.jpg?s=612x612&w=0&k=20&c=z6pZnG5JahaZ9JFHv7SJD8Kj_Sj-4g7ecLyQHgQqeC0=',
    ],
    highlights: ['White Sand', 'Limestone Cliffs', 'Calm Waves'],
    bestTime: 'Morning (9 AM – 12 PM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Pantai Padang Padang',
    location: 'Pecatu, Badung',
    tag: 'Pantai',
    tagColor: TagColors.pantai,
    description:
        'Pantai hidden gem yang dimasuki melalui celah batu karang sempit — mendadak terbuka jadi pantai mungil yang indah dengan ombak besar. Lokasi syuting film "Eat Pray Love" yang bikin Bali makin terkenal.',
    image: 'assets/images/destinations/pantai/padang-padang.jpeg',
    localImages: [
      'assets/images/destinations/pantai/padang-padang.jpeg',
      'assets/images/destinations/pantai/padang-padang2.jpeg',
      'assets/images/destinations/pantai/padang-padang3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
      'https://images.pexels.com/photos/33628177/pexels-photo-33628177.jpeg',
      'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=800',
    ],
    highlights: ['Hidden Cove', 'Surfing Spot', 'Eat Pray Love Location'],
    bestTime: 'Morning (8 AM – 12 PM)',
    duration: '1.5 – 2.5 hours',
  ),
  Destination(
    title: 'Seminyak Beach',
    location: 'Kuta Utara, Badung',
    tag: 'Pantai',
    tagColor: TagColors.pantai,
    description:
        'Versi premium dari Kuta. Beach club kelas dunia, restoran fine dining, dan butik fashion mewah berderet di tepi pantai. Sunset dari Potato Head Beach Club adalah pengalaman yang tidak terlupakan.',
    image: 'assets/images/destinations/pantai/seminyak.jpeg',
    localImages: [
      'assets/images/destinations/pantai/seminyak.jpeg',
      'assets/images/destinations/pantai/seminyak2.jpeg',
      'assets/images/destinations/pantai/seminyak3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1582719478250-c89cae4dc85b?w=800',
      'https://images.unsplash.com/photo-1571984405176-5958bd9ac31d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2VtaW55YWslMjBiZWFjaHxlbnwwfHwwfHx8MA%3D%3D',
      'https://media.istockphoto.com/id/669233390/id/foto/bar-pantai-seminyak-double-six.jpg?s=612x612&w=0&k=20&c=t06zEJufPo46uaULcJn7yxFcezwQT2HSOotTC7FZGUo=',
    ],
    highlights: ['Beach Club', 'Fine Dining', 'Luxury Shopping'],
    bestTime: 'Afternoon (3–8 PM)',
    duration: '3 – 5 hours',
  ),

  // ════════════════════════════════════════════════════════
  // BUDAYA
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Kecak Dance Uluwatu',
    location: 'Pecatu, Badung',
    tag: 'Budaya',
    tagColor: TagColors.budaya,
    description:
        'Pertunjukan tari Kecak yang paling dramatis di Bali — ratusan penari pria bertelanjang dada menyanyikan "cak" secara serempak dengan latar matahari terbenam di tepi tebing Uluwatu. Pengalaman budaya sekali seumur hidup.',
    image: 'assets/images/destinations/budaya/kecak.jpg',
    localImages: [
      'assets/images/destinations/budaya/kecak.jpg',
      'assets/images/destinations/budaya/kecak2.jpg',
      'assets/images/destinations/budaya/kecak3.jpg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800',
      'https://media.istockphoto.com/id/606002310/id/foto/kecak-dance-in-bali.jpg?s=612x612&w=0&k=20&c=-1hbSUAuFvkM1U_xbFIsuUDzDwRdkr5z04TNQMYnS9g=',
      'https://media.istockphoto.com/id/625771574/id/foto/kecak-dance-in-bali.jpg?s=612x612&w=0&k=20&c=EUGwsHLrE7DqbCQRO72Kg8bHx4U5Jgjf5BHtDsw3qLE=',
    ],
    highlights: ['Kecak Performance', 'Sunset Backdrop', 'Cultural Heritage'],
    bestTime: 'Sunset (5–7 PM)',
    duration: '1.5 – 2 hours',
  ),
  Destination(
    title: 'Desa Penglipuran',
    location: 'Bangli, Bali',
    tag: 'Budaya',
    tagColor: TagColors.budaya,
    description:
        'Desa adat Bali tertua yang terkenal sebagai salah satu desa terbersih di dunia. Jalanan berbatu rapi dengan deretan rumah adat berarsitektur identik dan pagar bambu yang tertata sempurna — seperti masuk mesin waktu ke Bali tempo dulu.',
    image: 'assets/images/destinations/budaya/panglipuran.jpeg',
    localImages: [
      'assets/images/destinations/budaya/panglipuran.jpeg',
      'assets/images/destinations/budaya/panglipuran2.jpeg',
      'assets/images/destinations/budaya/panglipuran3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573347673737-3d27f04cdb90?w=800',
      'https://images.unsplash.com/photo-1671080749889-19f8a69deb2b?q=80&w=876&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1680188700615-ed31c1d23054?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZGVzYSUyMHBlbmdsaXB1cmFufGVufDB8fDB8fHww',
    ],
    highlights: [
      'World Cleanest Village',
      'Traditional Architecture',
      'Bamboo Forest',
    ],
    bestTime: 'Morning (8–11 AM)',
    duration: '1.5 – 2 hours',
  ),
  Destination(
    title: 'Ubud Art Market & Puri Saren',
    location: 'Ubud, Gianyar',
    tag: 'Budaya',
    tagColor: TagColors.budaya,
    description:
        'Pusat kesenian Bali yang sesungguhnya. Pasar Ubud menjual kerajinan tangan, lukisan, dan kain tradisional dengan harga tawar. Di seberangnya, Puri Saren Agung — istana kerajaan Ubud — kadang menggelar pertunjukan tari malam hari.',
    image: 'assets/images/destinations/budaya/art_market.jpeg',
    localImages: [
      'assets/images/destinations/budaya/art_market.jpeg',
      'assets/images/destinations/budaya/art_market2.jpeg',
      'assets/images/destinations/budaya/art_market3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573347673737-3d27f04cdb90?w=800',
      'https://media.istockphoto.com/id/804036506/photo/famous-mask-souvenirs-at-ubud-market.webp?a=1&b=1&s=612x612&w=0&k=20&c=h55I_dmJNAeuMJl-Sz832gQq5Pad8Ry6ZLtv79aijUw=',
      'https://images.pexels.com/photos/16059269/pexels-photo-16059269.jpeg',
    ],
    highlights: ['Art Market', 'Royal Palace', 'Traditional Crafts'],
    bestTime: 'Morning (8 AM – 12 PM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Taman Werdhi Budaya',
    location: 'Denpasar, Bali',
    tag: 'Budaya',
    tagColor: TagColors.budaya,
    description:
        'Pusat seni dan budaya Bali terbesar yang aktif sepanjang tahun. Paling ramai saat Pesta Kesenian Bali (PKB) setiap Juni-Juli — panggung besar menampilkan tari, musik gamelan, dan pameran seni dari seluruh penjuru Bali.',
    image: 'assets/images/destinations/budaya/art_center.jpeg',
    localImages: [
      'assets/images/destinations/budaya/art_center.jpeg',
      'assets/images/destinations/budaya/art_center2.jpeg',
      'assets/images/destinations/budaya/art_center3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800',
      'https://thumbs.dreamstime.com/b/bailarines-balineses-de-barong-en-el-centro-arte-denpasar-julio-kalangan-ratna-kanda-bailarinas-balinesas-es-un-le%C3%B3n-como-406117571.jpg?w=768',
      'https://thumbs.dreamstime.com/b/barong-dancesr-jagat-kerti-denpasar-julio-centro-de-arte-kalangan-ratna-kanda-bailarinas-balinesas-es-un-le%C3%B3n-como-criatura-en-la-399371134.jpg?w=768',
    ],
    highlights: ['Bali Arts Festival', 'Gamelan Music', 'Traditional Dance'],
    bestTime: 'Evening (5–9 PM)',
    duration: '2 – 3 hours',
  ),

  // ════════════════════════════════════════════════════════
  // ADVENTURE
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Rafting Sungai Ayung',
    location: 'Ubud, Gianyar',
    tag: 'Adventure',
    tagColor: TagColors.adventure,
    description:
        'Arung jeram paling populer di Bali menyusuri Sungai Ayung sepanjang 9 km dengan 25+ jeram. Dikelilingi tebing hijau berlumut, relief ukiran batu kuno, dan hutan tropis lebat — adventure yang aman tapi tetap memacu adrenalin.',
    image: 'assets/images/destinations/adventure/rafting.jpeg',
    localImages: [
      'assets/images/destinations/adventure/rafting.jpeg',
      'assets/images/destinations/adventure/rafting2.jpeg',
      'assets/images/destinations/adventure/rafting3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://www.pelago.com/img/products/ID-Indonesia/ayung-river-rafting-tour-red-paddle/0512-0656_ayung-river-rafting-tour-red-paddle-indonesia-pelago8-large.webp',
      'https://www.pelago.com/img/products/ID-Indonesia/ayung-river-rafting-tour-red-paddle/0512-0655_ayung-river-rafting-tour-red-paddle-indonesia-pelago2-large.webp',
    ],
    highlights: ['White Water Rapids', 'Jungle Canyon', '9km River Route'],
    bestTime: 'Morning (8–11 AM)',
    duration: '3 – 4 hours',
  ),
  Destination(
    title: 'Mendaki Gunung Batur',
    location: 'Kintamani, Bangli',
    tag: 'Adventure',
    tagColor: TagColors.adventure,
    description:
        'Gunung dengan pemandangan sunrise paling epik di Bali. Trek dimulai dini hari pukul 2–3 AM, dan saat sampai puncak, kamu akan melihat lautan awan di bawah dan Danau Batur yang memesona.',
    image: 'assets/images/destinations/adventure/batur.jpg',
    localImages: [
      'assets/images/destinations/adventure/batur.jpg',
      'assets/images/destinations/adventure/batur2.jpg',
      'assets/images/destinations/adventure/batur3.jpg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800',
      'https://images.unsplash.com/photo-1501854140801-50d01698950b?w=800',
    ],
    highlights: ['Sunrise Trek', '1.717 MASL', 'Lake View'],
    bestTime: 'Pre-dawn (2–3 AM start)',
    duration: '5 – 7 hours',
  ),
  Destination(
    title: 'ATV Ride Ubud',
    location: 'Ubud, Gianyar',
    tag: 'Adventure',
    tagColor: TagColors.adventure,
    description:
        'Naik motor roda empat melewati jalur berlumpur, sawah bertingkat, sungai dangkal, dan bahkan masuk ke gua gelap. Track sepanjang 10 km yang bikin adrenalin naik tanpa henti — cocok untuk semua level pemula sekalipun.',
    image: 'assets/images/destinations/adventure/ATV.jpeg',
    localImages: [
      'assets/images/destinations/adventure/ATV.jpeg',
      'assets/images/destinations/adventure/ATV2.jpeg',
      'assets/images/destinations/adventure/ATV3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573347673737-3d27f04cdb90?w=800',
      'https://www.baliatvubud.com/wp-content/uploads/2023/10/Bali-ATV-Quad-Bike-North-Ubud-Tour-Gallery-3-400x284.webp',
      'https://www.baliatvubud.com/wp-content/uploads/2023/10/Bali-ATV-Quad-Bike-South-Ubud-Tour-G6-400x284.webp',
    ],
    highlights: ['Off-Road Track', 'Rice Field Route', 'Cave Passage'],
    bestTime: 'Morning (9 AM – 12 PM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Bali Swing Bongkasa',
    location: 'Bongkasa, Badung',
    tag: 'Adventure',
    tagColor: TagColors.adventure,
    description:
        'Ayunan ekstrem di atas jurang dengan pemandangan hutan lebat dan sungai di bawah. Beberapa titik swing ketinggiannya bisa mencapai 78 meter — bikin jantung copot sekaligus menghasilkan foto yang epik banget.',
    image: 'assets/images/destinations/adventure/bali_swing.jpg',
    localImages: [
      'assets/images/destinations/adventure/bali_swing.jpg',
      'assets/images/destinations/adventure/bali_swing2.jpg',
      'assets/images/destinations/adventure/bali_swing3.jpg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1540202404-d0c7fe46a1b5?w=800',
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://images.unsplash.com/photo-1573347673737-3d27f04cdb90?w=800',
    ],
    highlights: ['78m Height', 'Jungle View', 'Epic Photos'],
    bestTime: 'Morning (8–11 AM)',
    duration: '2 – 3 hours',
  ),

  // ════════════════════════════════════════════════════════
  // WATER SPORT
  // ════════════════════════════════════════════════════════
  // ════════════════════════════════════════════════════════
  // WATER SPORT (4 destinasi) — tambah di bawah Adventure
  // Tambah juga 'Water Sport' ke list tags di destination_list_screen.dart
  // dan TagColors.waterSport = Color(0xFF0369A1) di destination_model.dart
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Water Sport Tanjung Benoa',
    location: 'Tanjung Benoa, Badung',
    tag: 'Water Sport',
    tagColor: TagColors.waterSport,
    description:
        'Surga water sport terlengkap di Bali — banana boat, parasailing, jet ski, flying fish, hingga diving tersedia di satu kawasan. Perairan tenang Tanjung Benoa bikin aktivitasnya aman dan seru untuk semua usia.',
    image: 'assets/images/destinations/watersport/tanjung_benoa.jpeg',
    localImages: [
      'assets/images/destinations/watersport/tanjung_benoa.jpeg',
      'assets/images/destinations/watersport/tanjung_benoa2.jpeg',
      'assets/images/destinations/watersport/tanjung_benoa3.jpeg',
    ],
    networkImages: [
      'https://media.istockphoto.com/id/1464737462/id/foto/aktivitas-olahraga-air-ikan-terbang-di-tanjung-benoa.jpg?s=612x612&w=0&k=20&c=Zx_ZPd3OWSvkYS9N9sfXvsbR_m_Xwuzp7qICHaKv4BM=',
      'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=800',
      'https://media.istockphoto.com/id/1879123063/id/foto/wisatawan-sedang-asyik-bermain-banana-boat-di-pantai-benoa-dekat-nusa-dua-olahraga-air.jpg?s=612x612&w=0&k=20&c=WbxZWNYSUeoyRb6s1fUXhugoleZ4IK4sN3iv9Z_X4jE=',
    ],
    highlights: ['Banana Boat', 'Parasailing', 'Jet Ski'],
    bestTime: 'Morning (8 AM – 12 PM)',
    duration: '2 – 4 hours',
  ),
  Destination(
    title: 'Surfing Kuta & Legian',
    location: 'Kuta, Badung',
    tag: 'Water Sport',
    tagColor: TagColors.waterSport,
    description:
        'Pantai terbaik untuk belajar surfing di Bali — ombaknya konsisten, instruktur berpengalaman tersedia di sepanjang pantai, dan papan surfing bisa disewa murah. Cocok untuk pemula maupun yang udah jago.',
    image: 'assets/images/destinations/watersport/surfing_kuta.jpeg',
    localImages: [
      'assets/images/destinations/watersport/surfing_kuta.jpeg',
      'assets/images/destinations/watersport/surfing_kuta2.jpeg',
      'assets/images/destinations/watersport/surfing_kuta3.jpeg',
    ],
    networkImages: [
      'https://media.istockphoto.com/id/1222282897/id/foto/peselancar-di-pantai-kuta-bali-indonesia.jpg?s=612x612&w=0&k=20&c=xaJJ9OwKpUwQUdfWZ-ULvKlhAbqZVJVS4uSPoQZlUx8=',
      'https://media.istockphoto.com/id/1454499686/id/foto/wanita-peselancar-bule-muda-langsing-mengenakan-bikini-putih-membawa-papan-selancar-biru-saat.jpg?s=612x612&w=0&k=20&c=Ge3hwlp5jR6aSZrczEyC9BQkYRRud80_XBw1sRUmXyA=',
      'https://images.unsplash.com/photo-1530870110042-98b2cb110834?w=800',
    ],
    highlights: ['Beginner Friendly', 'Surf Lessons', 'Board Rental'],
    bestTime: 'Morning (6–10 AM)',
    duration: '2 – 3 hours',
  ),
  Destination(
    title: 'Snorkeling Amed',
    location: 'Amed, Karangasem',
    tag: 'Water Sport',
    tagColor: TagColors.waterSport,
    description:
        'Spot snorkeling terbaik di Bali timur dengan terumbu karang warna-warni dan ikan tropis yang melimpah. Highlight utamanya adalah Japanese Shipwreck — bangkai kapal perang Jepang yang kini jadi rumah bagi ribuan ikan.',
    image: 'assets/images/destinations/watersport/snorkeling_amed.jpeg',
    localImages: [
      'assets/images/destinations/watersport/snorkeling_amed.jpeg',
      'assets/images/destinations/watersport/snorkeling_amed2.jpeg',
      'assets/images/destinations/watersport/snorkeling_amed3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
      'https://media.istockphoto.com/id/1203515780/id/foto/candi-bawah-laut-di-samudra-biru-dekat-amed-bali-lokasi-menyelam-di-bali.jpg?s=612x612&w=0&k=20&c=IuWPZHujMO6WGzepxykd-wn0_6DKYIfs_DtdcUZefCY=',
      'https://images.pexels.com/photos/2121302/pexels-photo-2121302.jpeg',
    ],
    highlights: ['Japanese Shipwreck', 'Coral Reef', 'Tropical Fish'],
    bestTime: 'Morning (7–11 AM)',
    duration: '2 – 3 hours',
  ),
  // Destination(
  //   title: 'Diving Tulamben',
  //   location: 'Tulamben, Karangasem',
  //   tag: 'Water Sport',
  //   tagColor: TagColors.waterSport,
  //   description:
  //       'Spot diving legendaris dengan bangkai kapal USS Liberty sepanjang 120 meter yang sudah ditumbuhi karang. Visibility air sangat jernih, arus tenang, dan lokasi hanya 30 meter dari pantai — surga bagi penyelam semua level.',
  //   image: 'assets/images/destinations/watersport/diving_tulamben.jpeg',
  //   localImages: [
  //     'assets/images/destinations/watersport/diving_tulamben.jpeg',
  //     'assets/images/destinations/watersport/diving_tulamben2.jpeg',
  //     'assets/images/destinations/watersport/diving_tulamben3.jpeg',
  //   ],
  //   networkImages: [
  //     'https://images.unsplash.com/photo-1559628376-f3fe5f782a2a?w=800',
  //     'https://images.unsplash.com/photo-1544551763-46a013bb70d5?w=800',
  //     'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
  //   ],
  //   highlights: ['USS Liberty Wreck', 'All Levels', '30m From Shore'],
  //   bestTime: 'Morning (7–10 AM)',
  //   duration: '3 – 5 hours',
  // ),
  // ════════════════════════════════════════════════════════
  // ISLAND
  // ════════════════════════════════════════════════════════
  Destination(
    title: 'Nusa Penida',
    location: 'Klungkung, Bali',
    tag: 'Island',
    tagColor: TagColors.island,
    description:
        'Pulau terpencil dengan pemandangan yang memukau — Kelingking Beach dengan tebing berbentuk T-Rex, Angel Billabong yang biru jernih, dan Broken Beach yang dramatis. Instagram-worthy di setiap sudut.',
    image: 'assets/images/destinations/island/nusa_penida.jpeg',
    localImages: [
      'assets/images/destinations/island/nusa_penida.jpeg',
      'assets/images/destinations/island/nusa_penida2.jpeg',
      'assets/images/destinations/island/nusa_penida3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1573790387438-4da905039392?w=800',
      'https://plus.unsplash.com/premium_photo-1661962878782-8841a385019d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bnVzYSUyMHBlbmlkYXxlbnwwfHwwfHx8MA%3D%3D',
      'https://media.istockphoto.com/id/1211847449/photo/broken-beach-in-nusa-penida-island.webp?a=1&b=1&s=612x612&w=0&k=20&c=4o0-86EBx8GUvjShW6_amwO9tsXbv3PWLs63HmuSPtk=',
    ],
    highlights: ['Kelingking Beach', 'Broken Beach', "Angel's Billabong"],
    bestTime: 'Full Day (8 AM – 5 PM)',
    duration: 'Full Day',
  ),
  Destination(
    title: 'Nusa Lembongan',
    location: 'Klungkung, Bali',
    tag: 'Island',
    tagColor: TagColors.island,
    description:
        'Pulau kecil yang santai dengan vibe laid-back — beda banget sama keramaian Bali daratan. Devil\'s Tear dengan ombak ganas yang menghantam batu karang, Yellow Bridge yang ikonik, dan snorkeling di Manta Point jadi highlight utama.',
    image: 'assets/images/destinations/island/nusa_lembongan.jpeg',
    localImages: [
      'assets/images/destinations/island/nusa_lembongan.jpeg',
      'assets/images/destinations/island/nusa_lembongan2.jpeg',
      'assets/images/destinations/island/nusa_lembongan3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1518548419970-58e3b4079ab2?w=800',
      'https://images.pexels.com/photos/27487669/pexels-photo-27487669.jpeg',
      'https://images.unsplash.com/photo-1469967700385-5b0140e16e33?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    highlights: ["Devil's Tear", 'Yellow Bridge', 'Manta Snorkeling'],
    bestTime: 'Full Day (8 AM – 5 PM)',
    duration: 'Full Day',
  ),
  Destination(
    title: 'Nusa Ceningan',
    location: 'Klungkung, Bali',
    tag: 'Island',
    tagColor: TagColors.island,
    description:
        'Pulau terkecil dari Nusa Trio dengan pesona Blue Lagoon yang warnanya biru-hijau menakjubkan. Cliff jumping dari tebing setinggi 10 meter ke laut biru menjadi daya tarik utama bagi pecinta adrenalin.',
    image: 'assets/images/destinations/island/nusa_ceningan.jpeg',
    localImages: [
      'assets/images/destinations/island/nusa_ceningan.jpeg',
      'assets/images/destinations/island/nusa_ceningan2.jpeg',
      'assets/images/destinations/island/nusa_ceningan3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1559628376-f3fe5f782a2a?w=800',
      'https://images.unsplash.com/photo-1518731616603-4592e1212a4a?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1620034441342-0287f2b0f91b?q=80&w=774&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    highlights: ['Blue Lagoon', 'Cliff Jumping', 'Tiny Island Vibes'],
    bestTime: 'Morning (9 AM – 2 PM)',
    duration: 'Half Day',
  ),
  Destination(
    title: 'Pulau Menjangan',
    location: 'Buleleng, Bali',
    tag: 'Island',
    tagColor: TagColors.island,
    description:
        'Surga diving dan snorkeling terbaik di Bali dengan terumbu karang yang masih sangat perawan dan visibility air hingga 60 meter. Bagian dari Taman Nasional Bali Barat, pulau ini juga dihuni rusa-rusa liar yang jinak.',
    image: 'assets/images/destinations/island/menjangan.jpeg',
    localImages: [
      'assets/images/destinations/island/menjangan.jpeg',
      'assets/images/destinations/island/menjangan2.jpeg',
      'assets/images/destinations/island/menjangan3.jpeg',
    ],
    networkImages: [
      'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800',
      'https://images.unsplash.com/photo-1604126865533-2467eebd18f1?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      'https://images.unsplash.com/photo-1508245740873-1a4820efedf8?q=80&w=1003&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ],
    highlights: ['Pristine Coral Reef', 'Diving & Snorkeling', 'National Park'],
    bestTime: 'Morning (8 AM – 1 PM)',
    duration: '4 – 6 hours',
  ),
];

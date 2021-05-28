import '../../features/pharmacy/models/drug_card_model.dart';

import '../utilities.dart';

List<DrugCardModel> drugs = [
  DrugCardModel(
    packSize: '3x10',
    dispenseMethod: 'Packs',
    productId: 'PROBRYVPW1',
    drugName: 'Kezitil Susp.',
    drugConstituent: 'Tetra Phenol',
    drugType: 'Oral Suspension - 250mg',
    drugImage: makeNetworkAvatar(
        'https://webstockreview.net/images/drug-clipart-probiotic-14.png'),
    drugPrice: 5000,
    companyName: 'Emzor Pharmaceuticals',
  ),
  DrugCardModel(
    packSize: '3x10',
    dispenseMethod: 'Packs',
    productId: 'PROBRYVPW1',
    drugName: 'Kezitil',
    drugConstituent: 'Tetra Phenol',
    drugType: 'Tablet - 250mg',
    drugImage: makeNetworkAvatar(
        'https://pluspng.com/img-png/pill-png-hd-pills-transparent-background-839.png'),
    drugPrice: 5000,
    companyName: 'Mozer Pharmaceuticals',
  ),
  DrugCardModel(
    packSize: '3x10',
    dispenseMethod: 'Packs',
    productId: 'PROBRYVPW1',
    drugName: 'Phenollinee',
    drugConstituent: 'Tetra Phenol',
    drugType: 'Soft gel - 650mg',
    drugImage: makeNetworkAvatar(
        'http://getdrawings.com/cliparts/medicine-clipart-35.png'),
    drugPrice: 5000,
    companyName: 'Rozem Pharmaceuticals',
  ),
  DrugCardModel(
    packSize: '3x10',
    dispenseMethod: 'Packs',
    productId: 'PROBRYVPW1',
    drugName: 'Phenollinee',
    drugConstituent: 'Tetra Phenol',
    drugType: 'Tablet - 250mg',
    drugImage: makeNetworkAvatar(
        'https://creazilla-store.fra1.digitaloceanspaces.com/cliparts/29656/medicine-drugs-clipart-md.png'),
    drugPrice: 5000,
    companyName: 'Orzem Pharmaceuticals',
  ),
  DrugCardModel(
    packSize: '3x10',
    dispenseMethod: 'Packs',
    productId: 'PROBRYVPW1',
    drugName: 'Phenollinee',
    drugConstituent: 'Tetra Phenol',
    drugType: 'Phenolic Oil',
    drugImage: makeNetworkAvatar(
        'https://webstockreview.net/images/drug-clipart-probiotic-13.png'),
    drugPrice: 5000,
    companyName: 'Zemor Pharmaceuticals',
  ),
];

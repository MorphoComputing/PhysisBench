# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.06418634046672358

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 1+17+20+36+58+59+60+61+62+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SN3 and resi 20 and name CA, 1SN3 and resi 61 and name CA  # target=27.498255672130234 current=29.93483390464146
color yellow, pair_00
distance pair_01, 1SN3 and resi 19 and name CA, 1SN3 and resi 61 and name CA  # target=27.491413665040813 current=29.012880511743226
color yellow, pair_01
distance pair_02, 1SN3 and resi 20 and name CA, 1SN3 and resi 62 and name CA  # target=27.48787984693643 current=28.849817544912476
color yellow, pair_02
distance pair_03, 1SN3 and resi 17 and name CA, 1SN3 and resi 61 and name CA  # target=27.487388816996 current=28.730437900888923
color yellow, pair_03
distance pair_04, 1SN3 and resi 20 and name CA, 1SN3 and resi 60 and name CA  # target=27.479074534119015 current=28.574386733192757
color yellow, pair_04
distance pair_05, 1SN3 and resi 22 and name CA, 1SN3 and resi 61 and name CA  # target=27.46408200644338 current=28.262074924143164
color yellow, pair_05
distance pair_06, 1SN3 and resi 18 and name CA, 1SN3 and resi 63 and name CA  # target=23.63341746228932 current=24.417757759846182
color yellow, pair_06
distance pair_07, 1SN3 and resi 26 and name CA, 1SN3 and resi 60 and name CA  # target=23.72673444532014 current=24.472528756908126
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end

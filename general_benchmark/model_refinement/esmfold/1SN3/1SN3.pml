# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.9753416825097949

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 7+8+9+14+30+31+32+61+62+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1SN3 and resi 20 and name CA, 1SN3 and resi 61 and name CA  # target=27.34745693588315 current=30.224893673825846
color yellow, pair_00
distance pair_01, 1SN3 and resi 22 and name CA, 1SN3 and resi 61 and name CA  # target=27.226436997280494 current=29.277311096845075
color yellow, pair_01
distance pair_02, 1SN3 and resi 19 and name CA, 1SN3 and resi 61 and name CA  # target=27.20672808952516 current=28.98136630807478
color yellow, pair_02
distance pair_03, 1SN3 and resi 21 and name CA, 1SN3 and resi 61 and name CA  # target=27.017100677934774 current=28.445614083248653
color yellow, pair_03
distance pair_04, 1SN3 and resi 17 and name CA, 1SN3 and resi 61 and name CA  # target=27.125874209529627 current=28.54726287588788
color yellow, pair_04
distance pair_05, 1SN3 and resi 20 and name CA, 1SN3 and resi 60 and name CA  # target=26.86960218894386 current=28.228907742498333
color yellow, pair_05
distance pair_06, 1SN3 and resi 20 and name CA, 1SN3 and resi 62 and name CA  # target=26.694904915886735 current=27.87692266734629
color yellow, pair_06
distance pair_07, 1SN3 and resi 18 and name CA, 1SN3 and resi 61 and name CA  # target=26.921205981098822 current=27.944177590041576
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end

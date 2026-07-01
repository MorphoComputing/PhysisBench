# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.529598607354038

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 2+8+13+14+16+17+19+24+26+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2HIU and resi 5+6+44+46+60
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2HIU and resi 2 and name CA, 2HIU and resi 47 and name CA  # target=27.494791081984786 current=7.430559691064436
color yellow, pair_00
distance pair_01, 2HIU and resi 2 and name CA, 2HIU and resi 46 and name CA  # target=27.486238873216273 current=7.52607529332564
color yellow, pair_01
distance pair_02, 2HIU and resi 1 and name CA, 2HIU and resi 46 and name CA  # target=27.483733007622043 current=9.676476033799636
color yellow, pair_02
distance pair_03, 2HIU and resi 2 and name CA, 2HIU and resi 45 and name CA  # target=27.47471723276091 current=10.93457256603654
color yellow, pair_03
distance pair_04, 2HIU and resi 1 and name CA, 2HIU and resi 47 and name CA  # target=27.493569726602455 current=11.03133460697939
color yellow, pair_04
distance pair_05, 2HIU and resi 1 and name CA, 2HIU and resi 44 and name CA  # target=27.42148695636247 current=11.428049157865381
color yellow, pair_05
distance pair_06, 2HIU and resi 2 and name CA, 2HIU and resi 44 and name CA  # target=27.43738790179775 current=12.283984474748982
color yellow, pair_06
distance pair_07, 2HIU and resi 1 and name CA, 2HIU and resi 45 and name CA  # target=27.467647270095856 current=12.34465989268227
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end

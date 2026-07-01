# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4676874504341813

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 5+6+11+12+13+23+27+44+47+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1ENH and resi 5 and name CA, 1ENH and resi 30 and name CA  # target=16.956932352208714 current=18.602697352912273
color yellow, pair_00
distance pair_01, 1ENH and resi 5 and name CA, 1ENH and resi 42 and name CA  # target=9.993256335271825 current=11.310871553572147
color yellow, pair_01
distance pair_02, 1ENH and resi 13 and name CA, 1ENH and resi 27 and name CA  # target=11.841420577058647 current=12.97971087592865
color yellow, pair_02
distance pair_03, 1ENH and resi 7 and name CA, 1ENH and resi 25 and name CA  # target=23.28085434756635 current=24.24864369428893
color yellow, pair_03
distance pair_04, 1ENH and resi 8 and name CA, 1ENH and resi 27 and name CA  # target=18.16146732254437 current=19.10832864383451
color yellow, pair_04
distance pair_05, 1ENH and resi 9 and name CA, 1ENH and resi 27 and name CA  # target=15.221536903785307 current=16.12511796325482
color yellow, pair_05
distance pair_06, 1ENH and resi 7 and name CA, 1ENH and resi 24 and name CA  # target=23.086563679044183 current=23.929257078094473
color yellow, pair_06
distance pair_07, 1ENH and resi 8 and name CA, 1ENH and resi 24 and name CA  # target=21.593067911761267 current=22.395847596226563
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end

# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2HIU\sequence\2HIU.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\2HIU\seeds\seed_0\2HIU.pdb`
- residues: 47
- mode: refinement
- ca_rmsd: 7.164 A
- tm_score_ca_ordered: 0.16459417566274187
- heavy_atom_rmsd: 8.686 A
- sidechain_heavy_atom_rmsd: 9.906 A
- **all-atom quality (honest):** heavy 8.686 A, sidechain 9.906 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/43 (0.0)
- lj_severe: 0
- lj_near: 31
- distogram_pairs: 58
- bin_accuracy: 0.448

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** Y18-C19 → 9 conflicts (90%)
- explained: 9/10 conflicts by 1 root cause(s)
- metrics: hubs=5 (frac 0.106), conflicts/hub=2.0, max_incompat=4.96Å, chain_span=0.298
- **fix-first:** [LOW_CONFLICT] Root cause(s): Y18-C19 — explain ~9/10 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N17** — severity 2.50, 2 conflict(s); suspect input ~`Y13` (group: pull_in)
  - pull-in (wants closer): Y13@4.5Å(now 7.4,conf 0.39), C19@4.5Å(now 9.0,conf 0.39)
  - Y13↔C19: targets 4.5/4.5Å but partners are 12.7Å apart → too_far_apart by 3.7Å
  - Q14↔C19: targets 4.5/4.5Å but partners are 11.7Å apart → too_far_apart by 2.7Å
- **L15** — severity 2.24, 2 conflict(s); suspect input ~`Y13` (group: push_out)
  - pull-in (wants closer): C19@4.5Å(now 8.9,conf 0.39)
  - push-out (wants farther): L12@4.5Å(now 1.5,conf 0.39)
  - Y13↔C19: targets 4.5/4.5Å but partners are 12.7Å apart → too_far_apart by 3.7Å
  - C19↔S11: targets 4.5/3.5Å but partners are 13.0Å apart → too_far_apart by 5.0Å
- **Q14** — severity 1.50, 3 conflict(s); suspect input ~`Y18` (group: pull_in)
  - pull-in (wants closer): C10@3.5Å(now 6.4,conf 0.16), Y18@3.5Å(now 8.9,conf 0.16)
  - C6↔Y18: targets 4.0/3.5Å but partners are 11.4Å apart → too_far_apart by 3.9Å
  - C10↔Y18: targets 3.5/3.5Å but partners are 10.8Å apart → too_far_apart by 3.7Å
  - S11↔Y18: targets 4.5/3.5Å but partners are 9.9Å apart → too_far_apart by 1.8Å
- **E16** — severity 1.02, 2 conflict(s); suspect input ~`C19` (group: pull_in)
  - pull-in (wants closer): C19@5.5Å(now 9.9,conf 0.24)
  - Y13↔C19: targets 4.5/5.5Å but partners are 12.7Å apart → too_far_apart by 2.7Å
  - Q14↔C19: targets 4.5/5.5Å but partners are 11.7Å apart → too_far_apart by 1.7Å
- **E3** — severity 0.55, 1 conflict(s); suspect input ~`T7` (group: pull_in)
  - pull-in (wants closer): T7@4.5Å(now 7.3,conf 0.20)
  - I1↔T7: targets 4.5/4.5Å but partners are 11.8Å apart → too_far_apart by 2.8Å

## Secondary Structure (DSSP-like)

- helix(H)=33 · strand(E)=10 · 3-10(G)=3 · coil(C)=1

```
CGEHEHHGGHHHHHHHHEHHHHEHHEHHEHHHHEHHHHHHHHEEHHE
```

## Backbone H-bond Network

- total=37 · helix(i→i+4)=18 · sheet=19
  - C6 ↔ C10  (helix)
  - C10 ↔ Q14  (helix)
  - L12 ↔ E16  (helix)
  - Y13 ↔ N17  (helix)
  - L15 ↔ C19  (helix)
  - E16 ↔ V20  (helix)
  - N17 ↔ N21  (helix)
  - V20 ↔ L24  (helix)
  - N21 ↔ C25  (helix)
  - L24 ↔ H28  (helix)
  - S27 ↔ E31  (helix)
  - H28 ↔ A32  (helix)
  - E31 ↔ L35  (helix)
  - A32 ↔ V36  (helix)
  - L35 ↔ E39  (helix)
  - G38 ↔ F42  (helix)
  - G41 ↔ T45  (helix)
  - F42 ↔ P46  (helix)
  - E3 ↔ Y18  (sheet)
  - E3 ↔ H23  (sheet)
  - … +17 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=24 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=347 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=210 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.5722 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=31 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C10, C6–C25, C19–C37

## Side-chain Rotamers (χ1/χ2)

- 43 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2HIU.ensemble.pdb`)
- RMSF mean=2.599Å max=4.759Å (per-residue in .per_residue.csv)
- most flexible residues: 31, 33, 39, 47, 8

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2HIU.pae.csv`
- mean=1.35Å · max=5.713Å · AlphaFold-PAE analog (low block = rigid unit/domain)

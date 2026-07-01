# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\experimental_restraints\nmr_star\1VII\seeds\seed_0\1VII.pdb`
- residues: 34
- mode: refinement
- ca_rmsd: 4.042 A
- tm_score_ca_ordered: 0.22793592538015112
- heavy_atom_rmsd: 5.722 A
- sidechain_heavy_atom_rmsd: 6.959 A
- **all-atom quality (honest):** heavy 5.722 A, sidechain 6.959 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 59
- bin_accuracy: 0.492

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** A18 → 8 conflicts (62%); K29 → 3 conflicts (23%)
- explained: 11/13 conflicts by 2 root cause(s)
- metrics: hubs=4 (frac 0.118), conflicts/hub=3.2, max_incompat=4.14Å, chain_span=0.647
- **fix-first:** [LOW_CONFLICT] Root cause(s): A18 + K29 — explain ~11/13 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **A18** — severity 4.31, 7 conflict(s); suspect input ~`K7` (group: pull_in)
  - pull-in (wants closer): K7@4.0Å(now 8.3,conf 0.22), K30@4.0Å(now 7.8,conf 0.22), G33@4.7Å(now 7.9,conf 0.19)
  - P21↔K7: targets 4.0/4.0Å but partners are 12.2Å apart → too_far_apart by 4.1Å
  - K7↔K30: targets 4.0/4.0Å but partners are 11.4Å apart → too_far_apart by 3.3Å
  - K7↔K29: targets 4.0/4.0Å but partners are 10.8Å apart → too_far_apart by 2.8Å
- **K29** — severity 1.67, 3 conflict(s); suspect input ~`G33` (group: pull_in)
  - pull-in (wants closer): P21@4.0Å(now 6.7,conf 0.22), G33@3.5Å(now 6.0,conf 0.21)
  - P21↔G33: targets 4.0/3.5Å but partners are 11.2Å apart → too_far_apart by 3.7Å
  - P21↔K32: targets 4.0/4.3Å but partners are 10.9Å apart → too_far_apart by 2.5Å
  - Q25↔G33: targets 3.5/3.5Å but partners are 8.8Å apart → too_far_apart by 1.7Å
- **N27** — severity 1.27, 2 conflict(s); suspect input ~`W23` (group: pull_in)
  - pull-in (wants closer): E31@3.5Å(now 6.2,conf 0.21)
  - W23↔E31: targets 3.5/3.5Å but partners are 11.2Å apart → too_far_apart by 4.1Å
  - E31↔K24: targets 3.5/4.3Å but partners are 9.8Å apart → too_far_apart by 1.9Å
- **K7** — severity 0.50, 1 conflict(s); suspect input ~`E4` (group: pull_in)
  - pull-in (wants closer): A18@4.0Å(now 8.3,conf 0.22)
  - A18↔E4: targets 4.0/3.5Å but partners are 9.9Å apart → too_far_apart by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=25 · strand(E)=7 · 3-10(G)=0 · coil(C)=2

```
CEHHHEHHEHHHEHHHHHEHHHHHHHEHHHHEHC
```

## Backbone H-bond Network

- total=27 · helix(i→i+4)=15 · sheet=12
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - K7 ↔ G11  (helix)
  - A8 ↔ M12  (helix)
  - F10 ↔ R14  (helix)
  - G11 ↔ S15  (helix)
  - M12 ↔ A16  (helix)
  - R14 ↔ A18  (helix)
  - A16 ↔ L20  (helix)
  - F17 ↔ P21  (helix)
  - A18 ↔ L22  (helix)
  - L20 ↔ K24  (helix)
  - L22 ↔ Q26  (helix)
  - K24 ↔ L28  (helix)
  - K29 ↔ G33  (helix)
  - S2 ↔ V9  (sheet)
  - S2 ↔ T13  (sheet)
  - S2 ↔ N19  (sheet)
  - F6 ↔ T13  (sheet)
  - V9 ↔ N19  (sheet)
  - … +7 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=15 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=219 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=105 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.3365 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`1VII.ensemble.pdb`)
- RMSF mean=1.935Å max=4.827Å (per-residue in .per_residue.csv)
- most flexible residues: 20, 22, 29, 34, 23

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `1VII.pae.csv`
- mean=1.204Å · max=6.486Å · AlphaFold-PAE analog (low block = rigid unit/domain)

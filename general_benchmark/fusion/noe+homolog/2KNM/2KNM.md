# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2KNM\sequence\2KNM.pdb`
- output_pdb: `general_benchmark\fusion\noe+homolog\2KNM\seeds\seed_1\2KNM.pdb`
- residues: 28
- mode: refinement
- ca_rmsd: 2.588 A
- tm_score_ca_ordered: 0.3886393375503743
- heavy_atom_rmsd: 4.423 A
- sidechain_heavy_atom_rmsd: 5.746 A
- **all-atom quality (honest):** heavy 4.423 A, sidechain 5.746 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 2
- distogram_pairs: 207
- bin_accuracy: 0.783

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `STRUCTURAL_CONFLICT` (descriptive) — the fold cannot satisfy the restraints here (focal footprint); root_causes localize WHERE. Caveat: this is DESCRIPTIVE — it can reflect a genuine input defect OR a hard fold the engine did not fully converge (seen on clean L0 of large β-sheets), and register-shift/truncation/wrong-region are not blindly separable. Only INPUT_SELF_CONTRADICTORY is a pure input verdict; cross-check template length_ratio/coverage offline
- **root cause(s):** E5-S6 → 24 conflicts (92%)
- explained: 24/26 conflicts by 1 root cause(s)
- metrics: hubs=6 (frac 0.214), conflicts/hub=4.3, max_incompat=3.69Å, chain_span=0.5
- **fix-first:** [STRUCTURAL_CONFLICT] Root cause(s): E5-S6 — explain ~24/26 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I10** — severity 6.92, 7 conflict(s); suspect input ~`G4` (group: pull_in)
  - pull-in (wants closer): S6@3.8Å(now 7.6,conf 0.58)
  - S6↔G4: targets 3.8/13.5Å but partners are 6.4Å apart → too_close_together by 3.2Å
  - S6↔C26: targets 3.8/11.4Å but partners are 4.4Å apart → too_close_together by 3.2Å
  - S6↔P2: targets 3.8/16.2Å but partners are 9.3Å apart → too_close_together by 3.1Å
- **S6** — severity 5.08, 5 conflict(s); suspect input ~`P2` (group: pull_in)
  - pull-in (wants closer): I10@3.8Å(now 7.6,conf 0.58)
  - I10↔P2: targets 3.8/9.1Å but partners are 16.6Å apart → too_far_apart by 3.7Å
  - I10↔C26: targets 3.8/4.2Å but partners are 10.7Å apart → too_far_apart by 2.8Å
  - I10↔V25: targets 3.8/4.9Å but partners are 10.6Å apart → too_far_apart by 1.9Å
- **S14** — severity 3.91, 4 conflict(s); suspect input ~`I17` (group: pull_in)
  - pull-in (wants closer): C19@3.8Å(now 6.7,conf 0.58), E5@3.8Å(now 6.9,conf 0.58)
  - I17↔E5: targets 3.8/3.8Å but partners are 10.8Å apart → too_far_apart by 3.2Å
  - E5↔S6: targets 3.8/9.6Å but partners are 3.5Å apart → too_close_together by 2.3Å
  - C19↔S20: targets 3.8/9.8Å but partners are 3.9Å apart → too_close_together by 2.1Å
- **I13** — severity 3.60, 5 conflict(s); suspect input ~`G4` (group: pull_in)
  - pull-in (wants closer): E5@3.8Å(now 7.3,conf 0.58)
  - E5↔G4: targets 3.8/11.0Å but partners are 3.9Å apart → too_close_together by 3.3Å
  - E5↔S6: targets 3.8/9.2Å but partners are 3.5Å apart → too_close_together by 1.9Å
  - E5↔V25: targets 3.8/11.9Å but partners are 6.2Å apart → too_close_together by 1.9Å
- **E5** — severity 3.18, 4 conflict(s); suspect input ~`V25` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 6.9,conf 0.58), I13@3.8Å(now 7.3,conf 0.58)
  - I13↔P2: targets 3.8/7.3Å but partners are 13.8Å apart → too_far_apart by 2.6Å
  - S14↔I17: targets 3.8/11.8Å but partners are 5.2Å apart → too_close_together by 2.8Å
  - I13↔V25: targets 3.8/6.4Å but partners are 11.8Å apart → too_far_apart by 1.7Å
- **C19** — severity 0.55, 1 conflict(s); suspect input ~`I13` (group: pull_in)
  - pull-in (wants closer): S14@3.8Å(now 6.7,conf 0.58)
  - S14↔I13: targets 3.8/9.3Å but partners are 3.8Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=14 · strand(E)=8 · 3-10(G)=5 · coil(C)=1

```
CHGHEEHHHHGHHEHHHHEEGGHEEGHE
```

## Backbone H-bond Network

- total=23 · helix(i→i+4)=4 · sheet=19
  - G4 ↔ V8  (helix)
  - W9 ↔ I13  (helix)
  - I13 ↔ I17  (helix)
  - S23 ↔ Y27  (helix)
  - E5 ↔ S14  (sheet)
  - E5 ↔ C19  (sheet)
  - E5 ↔ S20  (sheet)
  - E5 ↔ K24  (sheet)
  - E5 ↔ V25  (sheet)
  - S6 ↔ S14  (sheet)
  - S6 ↔ C19  (sheet)
  - S6 ↔ S20  (sheet)
  - S6 ↔ K24  (sheet)
  - S6 ↔ V25  (sheet)
  - S14 ↔ C19  (sheet)
  - S14 ↔ S20  (sheet)
  - S14 ↔ V25  (sheet)
  - S14 ↔ R28  (sheet)
  - C19 ↔ K24  (sheet)
  - C19 ↔ V25  (sheet)
  - … +3 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=8 · exposed=12 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=118 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=67 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2882 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=2 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C3–C19, C7–C21, C12–C26

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

## Conformational Ensemble & Flexibility

- ensemble: 2 superposed models (`2KNM.ensemble.pdb`)
- RMSF mean=0.287Å max=1.83Å (per-residue in .per_residue.csv)
- most flexible residues: 23, 22, 16, 1, 21

## PAE-equivalent (pairwise positional error)

- N×N matrix (ensemble Cα–Cα distance std) → `2KNM.pae.csv`
- mean=0.206Å · max=2.17Å · AlphaFold-PAE analog (low block = rigid unit/domain)

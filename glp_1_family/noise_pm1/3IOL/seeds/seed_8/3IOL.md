# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\3IOL\sequence\3IOL.pdb`
- output_pdb: `glp_1_family\noise_pm1\3IOL\seeds\seed_8\3IOL.pdb`
- residues: 24
- mode: refinement
- ca_rmsd: 2.658 A
- tm_score_ca_ordered: 0.18978002051920093
- heavy_atom_rmsd: 4.073 A
- sidechain_heavy_atom_rmsd: 4.965 A
- **all-atom quality (honest):** heavy 4.073 A, sidechain 4.965 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/20 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 231
- bin_accuracy: 0.693

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** V6-S7 → 8 conflicts (100%)
- explained: 8/8 conflicts by 1 root cause(s)
- metrics: hubs=4 (frac 0.167), conflicts/hub=2.0, max_incompat=3.76Å, chain_span=0.833
- **fix-first:** [LOW_CONFLICT] Root cause(s): V6-S7 — explain ~8/8 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L22** — severity 4.61, 3 conflict(s); suspect input ~`S7` (group: pull_in)
  - pull-in (wants closer): V6@22.0Å(now 24.7,conf 0.55), S7@21.1Å(now 23.7,conf 0.53)
  - T3↔S7: targets 31.1/21.1Å but partners are 6.2Å apart → too_close_together by 3.8Å
  - T3↔V6: targets 31.1/22.0Å but partners are 6.0Å apart → too_close_together by 3.1Å
  - T1↔S7: targets 31.7/21.1Å but partners are 8.8Å apart → too_close_together by 1.8Å
- **V6** — severity 3.07, 3 conflict(s); suspect input ~`F2` (group: pull_in)
  - pull-in (wants closer): L22@22.0Å(now 24.7,conf 0.55), F2@6.2Å(now 8.9,conf 0.49)
  - L22↔F2: targets 22.0/6.2Å but partners are 30.6Å apart → too_far_apart by 2.4Å
  - L22↔T3: targets 22.0/5.5Å but partners are 29.6Å apart → too_far_apart by 2.1Å
  - F2↔Q13: targets 6.2/9.4Å but partners are 17.3Å apart → too_far_apart by 1.7Å
- **S7** — severity 1.52, 1 conflict(s); suspect input ~`T3` (group: pull_in)
  - pull-in (wants closer): L22@21.1Å(now 23.7,conf 0.53)
  - L22↔T3: targets 21.1/5.6Å but partners are 29.6Å apart → too_far_apart by 2.9Å
- **F2** — severity 0.70, 1 conflict(s); suspect input ~`Y9` (group: pull_in)
  - pull-in (wants closer): V6@6.2Å(now 8.9,conf 0.49)
  - V6↔Y9: targets 6.2/12.9Å but partners are 5.1Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=6 · 3-10(G)=2 · coil(C)=0

```
EHEHEHEHHHHHGGHHHHHEHHHE
```

## Backbone H-bond Network

- total=11 · helix(i→i+4)=10 · sheet=1
  - F2 ↔ V6  (helix)
  - S4 ↔ S8  (helix)
  - V6 ↔ L10  (helix)
  - S8 ↔ G12  (helix)
  - E11 ↔ A15  (helix)
  - G12 ↔ K16  (helix)
  - A15 ↔ I19  (helix)
  - E17 ↔ W21  (helix)
  - F18 ↔ L22  (helix)
  - I19 ↔ V23  (helix)
  - T1 ↔ S7  (sheet)

## Solvent Accessibility (burial)

- buried=10 · exposed=9 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=65 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.0661 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 20 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

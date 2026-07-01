# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 1.921 A
- tm_score_ca_ordered: 0.6782599022296899
- heavy_atom_rmsd: 3.551 A
- sidechain_heavy_atom_rmsd: 4.591 A
- **all-atom quality (honest):** heavy 3.551 A, sidechain 4.591 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 196
- bin_accuracy: 0.893

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** W24 → 6 conflicts (100%)
- explained: 6/6 conflicts by 1 root cause(s)
- metrics: hubs=2 (frac 0.054), conflicts/hub=3.0, max_incompat=2.83Å, chain_span=0.162
- **fix-first:** [LOW_CONFLICT] Root cause(s): W24 — explain ~6/6 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **P30** — severity 4.10, 3 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): W24@5.4Å(now 7.9,conf 0.70)
  - W24↔E23: targets 5.4/12.0Å but partners are 3.8Å apart → too_close_together by 2.8Å
  - W24↔L20: targets 5.4/13.7Å but partners are 6.2Å apart → too_close_together by 2.1Å
  - W24↔E16: targets 5.4/19.5Å but partners are 12.5Å apart → too_close_together by 1.7Å
- **W24** — severity 3.72, 3 conflict(s); suspect input ~`P30` (group: pull_in)
  - pull-in (wants closer): P30@5.4Å(now 7.9,conf 0.70)
  - E23↔P30: targets 3.8/5.4Å but partners are 11.3Å apart → too_far_apart by 2.2Å
  - P30↔R19: targets 5.4/8.6Å but partners are 15.8Å apart → too_far_apart by 1.8Å
  - G3↔P30: targets 33.3/5.4Å but partners are 40.2Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=8 · 3-10(G)=6 · coil(C)=0

```
EEEEHHHGHHHHHHHHHHHGHHHHHHGGHGHEHEGEE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=17 · sheet=1
  - F5 ↔ L9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - L9 ↔ M13  (helix)
  - S10 ↔ E14  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E14 ↔ V18  (helix)
  - E15 ↔ R19  (helix)
  - A17 ↔ F21  (helix)
  - V18 ↔ I22  (helix)
  - R19 ↔ E23  (helix)
  - F21 ↔ L25  (helix)
  - I22 ↔ K26  (helix)
  - L25 ↔ G29  (helix)
  - G29 ↔ G33  (helix)
  - S32 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=106 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=10 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6354 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

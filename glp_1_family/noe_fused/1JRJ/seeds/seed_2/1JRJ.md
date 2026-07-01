# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\noe_fused\1JRJ\seeds\seed_2\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 4.022 A
- tm_score_ca_ordered: 0.3129886567837157
- heavy_atom_rmsd: 5.297 A
- sidechain_heavy_atom_rmsd: 6.489 A
- **all-atom quality (honest):** heavy 5.297 A, sidechain 6.489 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 155
- bin_accuracy: 0.781

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** W24 → 6 conflicts (86%)
- explained: 6/7 conflicts by 1 root cause(s)
- metrics: hubs=3 (frac 0.081), conflicts/hub=2.3, max_incompat=2.86Å, chain_span=0.568
- **fix-first:** [LOW_CONFLICT] Root cause(s): W24 — explain ~6/7 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **W24** — severity 4.90, 4 conflict(s); suspect input ~`P30` (group: pull_in)
  - pull-in (wants closer): P30@5.4Å(now 8.0,conf 0.70)
  - G3↔P30: targets 33.3/5.4Å but partners are 40.8Å apart → too_far_apart by 2.1Å
  - F5↔P30: targets 27.8/5.4Å but partners are 35.1Å apart → too_far_apart by 1.9Å
  - E2↔P30: targets 37.5/5.4Å but partners are 44.5Å apart → too_far_apart by 1.5Å
- **P30** — severity 3.06, 2 conflict(s); suspect input ~`E23` (group: pull_in)
  - pull-in (wants closer): W24@5.4Å(now 8.0,conf 0.70)
  - E23↔W24: targets 12.0/5.4Å but partners are 3.8Å apart → too_close_together by 2.9Å
  - L20↔W24: targets 13.7/5.4Å but partners are 6.2Å apart → too_close_together by 2.1Å
- **L9** — severity 1.31, 1 conflict(s); suspect input ~`M13` (group: pull_in)
  - pull-in (wants closer): M13@6.9Å(now 9.5,conf 0.55)
  - T6↔M13: targets 5.8/6.9Å but partners are 15.1Å apart → too_far_apart by 2.4Å

## Secondary Structure (DSSP-like)

- helix(H)=18 · strand(E)=12 · 3-10(G)=6 · coil(C)=1

```
EEECHHGHEEGHHEHHHHEHHEHHGHEGHEHHHEGGE
```

## Backbone H-bond Network

- total=18 · helix(i→i+4)=7 · sheet=11
  - D8 ↔ Q12  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E16 ↔ L20  (helix)
  - A17 ↔ F21  (helix)
  - L20 ↔ W24  (helix)
  - G29 ↔ G33  (helix)
  - L9 ↔ E14  (sheet)
  - E14 ↔ R19  (sheet)
  - E14 ↔ I22  (sheet)
  - R19 ↔ P37  (sheet)
  - I22 ↔ N27  (sheet)
  - I22 ↔ P30  (sheet)
  - I22 ↔ A34  (sheet)
  - I22 ↔ P37  (sheet)
  - N27 ↔ A34  (sheet)
  - N27 ↔ P37  (sheet)
  - P30 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=4 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=15 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7091 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

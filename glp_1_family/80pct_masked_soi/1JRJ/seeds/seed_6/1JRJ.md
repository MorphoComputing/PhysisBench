# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_6\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.837 A
- tm_score_ca_ordered: 0.43860461011380186
- heavy_atom_rmsd: 4.728 A
- sidechain_heavy_atom_rmsd: 6.153 A
- **all-atom quality (honest):** heavy 4.728 A, sidechain 6.153 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 272
- bin_accuracy: 0.776

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=1.99Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **N27** — severity 0.30, 1 conflict(s); suspect input ~`G28` (group: push_out)
  - push-out (wants farther): P30@8.6Å(now 6.1,conf 0.82)
  - P30↔G28: targets 8.6/3.8Å but partners are 2.8Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=16 · 3-10(G)=4 · coil(C)=1

```
EEGGEEHHEHHEHEGHHHEHEHHEEHEGHHEHHCEEE
```

## Backbone H-bond Network

- total=32 · helix(i→i+4)=6 · sheet=26
  - S7 ↔ K11  (helix)
  - M13 ↔ A17  (helix)
  - E16 ↔ L20  (helix)
  - V18 ↔ I22  (helix)
  - I22 ↔ K26  (helix)
  - G29 ↔ G33  (helix)
  - F5 ↔ Q12  (sheet)
  - T6 ↔ Q12  (sheet)
  - L9 ↔ E14  (sheet)
  - Q12 ↔ R19  (sheet)
  - E14 ↔ R19  (sheet)
  - E14 ↔ F21  (sheet)
  - R19 ↔ W24  (sheet)
  - R19 ↔ L25  (sheet)
  - R19 ↔ P35  (sheet)
  - R19 ↔ P36  (sheet)
  - R19 ↔ P37  (sheet)
  - F21 ↔ N27  (sheet)
  - F21 ↔ P35  (sheet)
  - F21 ↔ P36  (sheet)
  - … +12 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=19 · exposed=5 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=104 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=12 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9634 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

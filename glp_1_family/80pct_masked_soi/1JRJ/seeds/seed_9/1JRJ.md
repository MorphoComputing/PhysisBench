# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1JRJ\sequence\1JRJ.pdb`
- output_pdb: `glp_1_family\80pct_masked_soi\1JRJ\seeds\seed_9\1JRJ.pdb`
- residues: 37
- mode: refinement
- ca_rmsd: 2.828 A
- tm_score_ca_ordered: 0.40829341585932694
- heavy_atom_rmsd: 4.580 A
- sidechain_heavy_atom_rmsd: 5.810 A
- **all-atom quality (honest):** heavy 4.580 A, sidechain 5.810 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/30 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 267
- bin_accuracy: 0.753

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.027), conflicts/hub=1.0, max_incompat=2.29Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **M13** — severity 0.37, 1 conflict(s); suspect input ~`Q12` (group: push_out)
  - push-out (wants farther): S10@8.8Å(now 5.5,conf 0.61)
  - S10↔Q12: targets 8.8/3.8Å but partners are 2.7Å apart → too_close_together by 2.3Å

## Secondary Structure (DSSP-like)

- helix(H)=15 · strand(E)=14 · 3-10(G)=6 · coil(C)=2

```
EEEEHEEHEHHHHHHHHGHEECGGEHHHHGGEGEECE
```

## Backbone H-bond Network

- total=17 · helix(i→i+4)=5 · sheet=12
  - D8 ↔ Q12  (helix)
  - K11 ↔ E15  (helix)
  - Q12 ↔ E16  (helix)
  - M13 ↔ A17  (helix)
  - E15 ↔ R19  (helix)
  - E2 ↔ S7  (sheet)
  - T4 ↔ L9  (sheet)
  - L20 ↔ L25  (sheet)
  - L20 ↔ P35  (sheet)
  - L20 ↔ P37  (sheet)
  - F21 ↔ A34  (sheet)
  - F21 ↔ P35  (sheet)
  - F21 ↔ P37  (sheet)
  - L25 ↔ S32  (sheet)
  - L25 ↔ A34  (sheet)
  - L25 ↔ P35  (sheet)
  - L25 ↔ P37  (sheet)

## Solvent Accessibility (burial)

- buried=19 · exposed=6 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=102 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=17 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.7212 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 30 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_3\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.722 A
- tm_score_ca_ordered: 0.2986512860124985
- heavy_atom_rmsd: 5.200 A
- sidechain_heavy_atom_rmsd: 6.569 A
- **all-atom quality (honest):** heavy 5.200 A, sidechain 6.569 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.724

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.037), conflicts/hub=1.0, max_incompat=2.51Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S15** — severity 1.11, 1 conflict(s); suspect input ~`S10` (group: push_out)
  - push-out (wants farther): S10@11.3Å(now 8.7,conf 0.44)
  - Y12↔S10: targets 5.1/11.3Å but partners are 3.6Å apart → too_close_together by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=16 · strand(E)=4 · 3-10(G)=6 · coil(C)=1

```
EEHGHHHEHHHHHHHHGHGGGHGHHCE
```

## Backbone H-bond Network

- total=10 · helix(i→i+4)=10 · sheet=0
  - G3 ↔ S7  (helix)
  - F5 ↔ Y9  (helix)
  - T6 ↔ S10  (helix)
  - S7 ↔ K11  (helix)
  - Y9 ↔ L13  (helix)
  - S10 ↔ D14  (helix)
  - K11 ↔ S15  (helix)
  - Y12 ↔ R16  (helix)
  - D14 ↔ A18  (helix)
  - A18 ↔ V22  (helix)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=68 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9368 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

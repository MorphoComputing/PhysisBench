# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\glp_1_family\1GCN\sequence\1GCN.pdb`
- output_pdb: `glp_1_family\noise_pm1\1GCN\seeds\seed_5\1GCN.pdb`
- residues: 27
- mode: refinement
- ca_rmsd: 2.414 A
- tm_score_ca_ordered: 0.36855467071246906
- heavy_atom_rmsd: 4.491 A
- sidechain_heavy_atom_rmsd: 5.605 A
- **all-atom quality (honest):** heavy 4.491 A, sidechain 5.605 A
- backbone_drift_allatom: 0.001 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/25 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 340
- bin_accuracy: 0.712

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=2 (frac 0.074), conflicts/hub=1.0, max_incompat=2.55Å, chain_span=0.222
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L13** — severity 1.13, 1 conflict(s); suspect input ~`S7` (group: push_out)
  - push-out (wants farther): S7@13.2Å(now 10.4,conf 0.44)
  - Y9↔S7: targets 6.9/13.2Å but partners are 3.8Å apart → too_close_together by 2.5Å
- **S7** — severity 0.67, 1 conflict(s); suspect input ~`L13` (group: push_out)
  - push-out (wants farther): L13@13.2Å(now 10.4,conf 0.44)
  - K11↔L13: targets 6.7/13.2Å but partners are 5.0Å apart → too_close_together by 1.5Å

## Secondary Structure (DSSP-like)

- helix(H)=17 · strand(E)=7 · 3-10(G)=2 · coil(C)=1

```
CEGEEHEHHHHGHHHHHHEHHHEHHHE
```

## Backbone H-bond Network

- total=9 · helix(i→i+4)=7 · sheet=2
  - T6 ↔ S10  (helix)
  - K11 ↔ S15  (helix)
  - R16 ↔ D20  (helix)
  - A18 ↔ V22  (helix)
  - D20 ↔ W24  (helix)
  - F21 ↔ L25  (helix)
  - V22 ↔ M26  (helix)
  - Q2 ↔ S7  (sheet)
  - Q19 ↔ N27  (sheet)

## Solvent Accessibility (burial)

- buried=14 · exposed=8 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=68 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=0 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9334 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 25 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

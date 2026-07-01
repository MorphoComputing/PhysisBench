# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\2CRD\sequence\2CRD.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\2CRD\seeds\seed_6\2CRD.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 2.934 A
- tm_score_ca_ordered: 0.41541456552691125
- heavy_atom_rmsd: 4.232 A
- sidechain_heavy_atom_rmsd: 5.147 A
- **all-atom quality (honest):** heavy 4.232 A, sidechain 5.147 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/33 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 215
- bin_accuracy: 0.633

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=residue_block reason=rejected_lj_regression tested=27
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 2.9338031042091965
- ga_delta_rmsd: 3.349860420897646  ga_fitness_mode: energy
- pre_local_rmsd: 2.933838881234046  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=2.1Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K25** — severity 1.14, 1 conflict(s); suspect input ~`T1` (group: push_out)
  - push-out (wants farther): T1@11.1Å(now 6.7,conf 0.55)
  - R32↔T1: targets 4.4/11.1Å but partners are 4.6Å apart → too_close_together by 2.1Å

## Secondary Structure (DSSP-like)

- helix(H)=11 · strand(E)=16 · 3-10(G)=5 · coil(C)=2

```
EEEECHEEHHHEHEHEHHEHHGEGEGGHEEECGE
```

## Backbone H-bond Network

- total=42 · helix(i→i+4)=5 · sheet=37
  - T6 ↔ E10  (helix)
  - K9 ↔ S13  (helix)
  - C11 ↔ C15  (helix)
  - S13 ↔ R17  (helix)
  - R17 ↔ T21  (helix)
  - T1 ↔ W12  (sheet)
  - T1 ↔ V14  (sheet)
  - T1 ↔ Q16  (sheet)
  - N2 ↔ V14  (sheet)
  - V3 ↔ S8  (sheet)
  - V3 ↔ W12  (sheet)
  - V3 ↔ V14  (sheet)
  - V3 ↔ Q16  (sheet)
  - V3 ↔ R23  (sheet)
  - S4 ↔ W12  (sheet)
  - S4 ↔ V14  (sheet)
  - T7 ↔ W12  (sheet)
  - T7 ↔ V14  (sheet)
  - T7 ↔ K25  (sheet)
  - S8 ↔ V14  (sheet)
  - … +22 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=9 · exposed=17 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=153 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=88 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=1.2636 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C26, C11–C31, C15–C33

## Side-chain Rotamers (χ1/χ2)

- 33 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

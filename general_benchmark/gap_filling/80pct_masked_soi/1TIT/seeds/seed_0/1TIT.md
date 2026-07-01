# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1TIT\sequence\1TIT.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1TIT\seeds\seed_0\1TIT.pdb`
- residues: 87
- mode: oracle
- ca_rmsd: 0.977 A
- tm_score_ca_ordered: 0.9443008924736094
- heavy_atom_rmsd: 2.904 A
- sidechain_heavy_atom_rmsd: 3.843 A
- **all-atom quality (honest):** heavy 2.904 A, sidechain 3.843 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/73 (0.0)
- lj_severe: 0
- lj_near: 6
- distogram_pairs: 1027
- bin_accuracy: 0.875

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=False kind=domain reason=insufficient_rmsd_improvement tested=45
- rigid_domain_reconvergence: applied=False accepted=0 rmsd=None -> None A
- topology_reconvergence: applied=False accepted=0/0
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 0.976782344685949
- ga_delta_rmsd: 3.1564830118154816  ga_fitness_mode: energy
- pre_local_rmsd: 0.9939413522609982  localized_anchor_rmsd: 0.9768209007750438

## Failure Classification

- primary_reason: `LOCAL_HOTSPOT_REMAINS`
- reasons: `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.011), conflicts/hub=1.0, max_incompat=2.52Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **I1** — severity 1.38, 1 conflict(s); suspect input ~`E26` (group: push_out)
  - pull-in (wants closer): E87@27.5Å(now 35.6,conf 1.00), F13@27.5Å(now 32.0,conf 1.00), Q63@27.5Å(now 30.8,conf 1.00)
  - push-out (wants farther): I49@20.2Å(now 17.6,conf 0.58)
  - E87↔E26: targets 27.5/6.7Å but partners are 36.7Å apart → too_far_apart by 2.5Å

## Secondary Structure (DSSP-like)

- helix(H)=10 · strand(E)=46 · 3-10(G)=21 · coil(C)=10

```
CEGHEEGECEEHHGHEEEECEECEEECEECEECEGHGEGEEGEEHEECCEGEHEEGGGCEHGEHGHEEEGGGEEGGEGEEEEGEGEE
```

## Backbone H-bond Network

- total=74 · helix(i→i+4)=0 · sheet=74
  - E2 ↔ I22  (sheet)
  - K5 ↔ E21  (sheet)
  - K5 ↔ I22  (sheet)
  - K5 ↔ L24  (sheet)
  - K5 ↔ S25  (sheet)
  - P6 ↔ H19  (sheet)
  - P6 ↔ E21  (sheet)
  - P6 ↔ I22  (sheet)
  - P6 ↔ L24  (sheet)
  - P6 ↔ S25  (sheet)
  - Y8 ↔ A18  (sheet)
  - Y8 ↔ H19  (sheet)
  - Y8 ↔ E21  (sheet)
  - Y8 ↔ I22  (sheet)
  - V10 ↔ E16  (sheet)
  - V10 ↔ T17  (sheet)
  - V10 ↔ A18  (sheet)
  - V10 ↔ H19  (sheet)
  - V10 ↔ E21  (sheet)
  - E11 ↔ E16  (sheet)
  - … +54 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=29 · exposed=27 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=355 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=233 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.4729 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=6 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 73 residues with modelled χ angles (full table in report JSON)

## Warnings

- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

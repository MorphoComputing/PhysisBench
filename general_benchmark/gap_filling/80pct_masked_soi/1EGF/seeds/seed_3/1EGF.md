# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1EGF\sequence\1EGF.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1EGF\seeds\seed_3\1EGF.pdb`
- residues: 51
- mode: oracle
- ca_rmsd: 1.951 A
- tm_score_ca_ordered: 0.7561596396997557
- heavy_atom_rmsd: 3.917 A
- sidechain_heavy_atom_rmsd: 5.059 A
- **all-atom quality (honest):** heavy 3.917 A, sidechain 5.059 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 3/3
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/45 (0.0)
- lj_severe: 0
- lj_near: 5
- distogram_pairs: 413
- bin_accuracy: 0.748

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=33
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=5.821166082929882 -> 5.3688630081186055 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.9505742800832193
- ga_delta_rmsd: 1.9415619781543634  ga_fitness_mode: energy
- pre_local_rmsd: 1.9668771815380859  localized_anchor_rmsd: 1.9505391606968197

## Failure Classification

- primary_reason: `BACKBONE_TARGET_MISSED`
- reasons: `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.02), conflicts/hub=1.0, max_incompat=1.58Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **S8** — severity 1.44, 1 conflict(s); suspect input ~`C5` (group: push_out)
  - push-out (wants farther): P3@15.0Å(now 11.5,conf 0.99)
  - P3↔C5: targets 15.0/8.9Å but partners are 4.5Å apart → too_close_together by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=13 · strand(E)=24 · 3-10(G)=4 · coil(C)=10

```
EEGHHEHHEHEECEHGEECEEGGHCCEEECECEHCEEEHEHHHHEECECEC
```

## Backbone H-bond Network

- total=80 · helix(i→i+4)=2 · sheet=78
  - G4 ↔ S8  (helix)
  - D39 ↔ T43  (helix)
  - S1 ↔ M20  (sheet)
  - S1 ↔ H21  (sheet)
  - Y2 ↔ M20  (sheet)
  - Y2 ↔ H21  (sheet)
  - P6 ↔ G11  (sheet)
  - P6 ↔ Y12  (sheet)
  - P6 ↔ M20  (sheet)
  - P6 ↔ H21  (sheet)
  - Y9 ↔ L14  (sheet)
  - Y9 ↔ V18  (sheet)
  - Y9 ↔ M20  (sheet)
  - G11 ↔ G17  (sheet)
  - G11 ↔ V18  (sheet)
  - G11 ↔ M20  (sheet)
  - G11 ↔ T29  (sheet)
  - Y12 ↔ G17  (sheet)
  - Y12 ↔ V18  (sheet)
  - Y12 ↔ M20  (sheet)
  - … +60 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=16 · exposed=26 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=196 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=109 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.9274 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=5 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Disulfide Bonds Formed

- count=3: C5–C19, C13–C30, C32–C41

## Side-chain Rotamers (χ1/χ2)

- 45 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

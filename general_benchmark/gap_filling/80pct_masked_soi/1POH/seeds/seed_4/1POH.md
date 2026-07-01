# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1POH\sequence\1POH.pdb`
- output_pdb: `general_benchmark\gap_filling\80pct_masked_soi\1POH\seeds\seed_4\1POH.pdb`
- residues: 83
- mode: oracle
- ca_rmsd: 1.083 A
- tm_score_ca_ordered: 0.9160359631398768
- heavy_atom_rmsd: 2.802 A
- sidechain_heavy_atom_rmsd: 3.595 A
- **all-atom quality (honest):** heavy 2.802 A, sidechain 3.595 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/68 (0.0)
- lj_severe: 0
- lj_near: 10
- distogram_pairs: 957
- bin_accuracy: 0.827

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=45
- rigid_domain_reconvergence: applied=True accepted=15 rmsd=7.220034203702396 -> 6.520279885462801 A
- topology_reconvergence: applied=True accepted=0/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 1.0833615747904923
- ga_delta_rmsd: 5.257156357617443  ga_fitness_mode: energy
- pre_local_rmsd: 1.0960828348560083  localized_anchor_rmsd: 1.083342917410344

## Failure Classification

- primary_reason: `BACKBONE_NEAR_MISS_LT_1A`
- reasons: `BACKBONE_NEAR_MISS_LT_1A`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/2 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.012), conflicts/hub=2.0, max_incompat=2.64Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/2 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **K39** — severity 2.52, 2 conflict(s); suspect input ~`E4` (group: push_out)
  - push-out (wants farther): E4@14.1Å(now 11.4,conf 0.55)
  - T35↔E4: targets 5.0/14.1Å but partners are 6.4Å apart → too_close_together by 2.6Å
  - S36↔E4: targets 5.4/14.1Å but partners are 6.7Å apart → too_close_together by 2.0Å

## Secondary Structure (DSSP-like)

- helix(H)=29 · strand(E)=25 · 3-10(G)=13 · coil(C)=16

```
CEECECCCECHEHEHGHHHEHHEHHHHEGEGCEECEHHEEEGGHEHGHHGCEGCECCECEGCCEGEHHEHHEHGGHHGHHHHC
```

## Backbone H-bond Network

- total=39 · helix(i→i+4)=10 · sheet=29
  - L13 ↔ P17  (helix)
  - P17 ↔ F21  (helix)
  - A18 ↔ V22  (helix)
  - F21 ↔ A25  (helix)
  - V22 ↔ K26  (helix)
  - K44 ↔ K48  (helix)
  - E67 ↔ K71  (helix)
  - V73 ↔ V77  (helix)
  - L76 ↔ M80  (helix)
  - V77 ↔ A81  (helix)
  - A9 ↔ H14  (sheet)
  - H14 ↔ Q20  (sheet)
  - K23 ↔ F28  (sheet)
  - F28 ↔ T33  (sheet)
  - T33 ↔ K39  (sheet)
  - T33 ↔ S40  (sheet)
  - T33 ↔ A41  (sheet)
  - T33 ↔ S45  (sheet)
  - T33 ↔ L52  (sheet)
  - V34 ↔ K39  (sheet)
  - … +19 more (see .hbonds.csv)

## Solvent Accessibility (burial)

- buried=34 · exposed=23 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=329 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=170 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.6172 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=10 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 68 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.

# Physis Fold — Run Report

**Verdict:** PASS_WITH_WARNINGS

- reference_pdb: `set\general_benchmark\1VII\sequence\1VII.pdb`
- output_pdb: `general_benchmark\evidence_ladder\50pct_masked\1VII\seeds\seed_1\1VII.pdb`
- residues: 34
- mode: oracle
- ca_rmsd: 4.862 A
- tm_score_ca_ordered: 0.4003425005181279
- heavy_atom_rmsd: 5.772 A
- sidechain_heavy_atom_rmsd: 6.443 A
- **all-atom quality (honest):** heavy 5.772 A, sidechain 6.443 A
- backbone_drift_allatom: 0.000 A
- disulfides_locked: 0/0
- ramachandran_forbidden_fraction: 0.000
- rotamer_outliers: 0/29 (0.0)
- lj_severe: 0
- lj_near: 0
- distogram_pairs: 248
- bin_accuracy: 0.734

## Internal diagnostics (dev only)

- global_topology_guard: enabled=True applied=True kind=global reason=accepted tested=27
- rigid_domain_reconvergence: applied=True accepted=5 rmsd=3.4623407198105145 -> 3.1618133552628325 A
- topology_reconvergence: applied=True accepted=1/36
- phase_b_sidechain_refine: enabled=True applied=True moved_atoms=0 mode=rotamer
- phase_b_ca_rmsd_after: 4.861874117645322
- ga_delta_rmsd: -1.8882151005418923  ga_fitness_mode: energy
- pre_local_rmsd: 4.861765109832543  localized_anchor_rmsd: None

## Failure Classification

- primary_reason: `GA_NO_BACKBONE_IMPROVEMENT`
- reasons: `GA_NO_BACKBONE_IMPROVEMENT`, `BACKBONE_TARGET_MISSED`, `LOCAL_HOTSPOT_REMAINS`, `HEAVY_ATOM_RMSD_HIGH`, `SIDECHAIN_RMSD_HIGH`

## Conflict Diagnosis (provisional)

- **signature:** `LOW_CONFLICT` (descriptive) — few restraint conflicts — the input is broadly consistent with the fold the engine reached (no actionable input defect surfaced)
- **root cause(s):** —
- explained: 0/1 conflicts by 0 root cause(s)
- metrics: hubs=1 (frac 0.029), conflicts/hub=1.0, max_incompat=1.62Å, chain_span=0.0
- **fix-first:** [LOW_CONFLICT] Root cause(s): — — explain ~0/1 conflicts. Revisit these inputs first.

## Restraint Conflicts (Causal Attribution)

Residues pulled by mutually unsatisfiable restraints. The incompatibility is a blind triangle-inequality test on the input targets + current partner geometry (no native metric), so it points at *which input to revisit*, not just where the error lands.

- **L28** — severity 0.88, 1 conflict(s); suspect input ~`L34` (group: pull_in)
  - pull-in (wants closer): L34@9.0Å(now 12.3,conf 0.55)
  - K24↔L34: targets 6.0/9.0Å but partners are 16.6Å apart → too_far_apart by 1.6Å

## Secondary Structure (DSSP-like)

- helix(H)=23 · strand(E)=4 · 3-10(G)=3 · coil(C)=4

```
EHHHHHHHCCCEHHHHHHHEHHHHHHGHGHEGHC
```

## Backbone H-bond Network

- total=12 · helix(i→i+4)=10 · sheet=2
  - S2 ↔ F6  (helix)
  - D3 ↔ K7  (helix)
  - E4 ↔ A8  (helix)
  - T13 ↔ F17  (helix)
  - R14 ↔ A18  (helix)
  - S15 ↔ N19  (helix)
  - F17 ↔ P21  (helix)
  - N19 ↔ W23  (helix)
  - P21 ↔ Q25  (helix)
  - Q26 ↔ K30  (helix)
  - L1 ↔ M12  (sheet)
  - M12 ↔ L20  (sheet)

## Solvent Accessibility (burial)

- buried=12 · exposed=14 (per-residue exposure/state in .per_residue.csv)

## Predicted Contact Map

- contacts=112 (≤8Å Cα–Cα) · long-range(|i−j|≥6)=21 — full list in .contact_map.csv

## Energy Decomposition (blind)

- distogram_nll=0.8193 (restraint satisfaction; lower=better)
- lj_severe=0 · lj_near=0 (steric clashes)
- ramachandran_forbidden_fraction=0.0

## Side-chain Rotamers (χ1/χ2)

- 29 residues with modelled χ angles (full table in report JSON)

## Warnings

- Final CA RMSD is above the <1.0 A ceiling target.
- Matched heavy-atom RMSD is high; side-chain placement needs refinement.
- Side-chain heavy-atom RMSD is high; rotamer/packing refinement is not production-ready.
